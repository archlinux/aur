# Maintainer: Daniel Maslowski <info@orangecms.org>

pkgname=cypress
pkgver=3.1.5
pkgrel=1
pkgdesc='test engine that runs unit and integration tests in your browser'
arch=('x86_64')
url='http://www.cypress.io'
license=('MIT')
depends=('xorg-server-xvfb' 'lib32-gtk2' 'lib32-gconf>=2.4' 'lib32-nss' 'libnotify')
makedepends=('unzip')
optdepends=('nodejs-cypress-cli: for headless mode')
source=(
  "cypress-$pkgver.zip::https://download.cypress.io/desktop/$pkgver?os=linux64"
  'cypress.desktop'
)
sha512sums=('279654119c8413ba67aa1c56a5df8f5c563e77d823d67c55b9b877879955da13f3ae33b33712ef9d5d19819d06134e37164f4509299d84ca964568434fa2f25b'
            '1b48157cf3ddd21ca58e2cd3df7998c01966a02a544fdfc7c5eedf5aee8757c541d5dc9df64fcdee65256a29141fa491c638bf9cd98b4e9df5030ec98ebc4251')

package() {
  mkdir "$pkgdir/opt"
  cp -a "$srcdir/Cypress" "$pkgdir/opt/Cypress"
  install -Dm 644 cypress.desktop "$pkgdir/usr/share/applications/cypress.desktop"
  install -Dm 644 "$srcdir/Cypress/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 "$srcdir/Cypress/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}

# Maintainer: Daniel Maslowski <info@orangecms.org>

pkgname=cypress
pkgver=0.18.4
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
sha512sums=('374f68a65879ec1d8dcbc0fc8938f2483de671df9b81221754a908db10c3a73207611067547c56fbc4b6c38f944a333cc2c8955d04849dd8036fb32c90c30da2'
            '1b48157cf3ddd21ca58e2cd3df7998c01966a02a544fdfc7c5eedf5aee8757c541d5dc9df64fcdee65256a29141fa491c638bf9cd98b4e9df5030ec98ebc4251')

package() {
  mkdir "$pkgdir/opt"
  cp -a "$srcdir/Cypress" "$pkgdir/opt/Cypress"
  chmod 666 "$pkgdir/opt/Cypress/resources/app/node_modules/@cypress/core-extension/dist/background.js"
  install -Dm 644 cypress.desktop "$pkgdir/usr/share/applications/cypress.desktop"
  install -Dm 644 "$srcdir/Cypress/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 "$srcdir/Cypress/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}

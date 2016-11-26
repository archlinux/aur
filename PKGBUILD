# Maintainer: Daniel Maslowski <info@orangecms.org>

pkgname=cypress
pkgver=0.17.12
pkgrel=1
pkgdesc='test engine that runs unit and integration tests in your browser'
arch=('x86_64')
url='http://www.cypress.io'
license=('MIT')
depends=('xorg-server-xvfb' 'lib32-gtk2' 'lib32-gconf>=2.4' 'lib32-nss' 'libnotify')
makedepends=('unzip')
optdepends=('nodejs-cypress-cli: for headless mode')
source=(
  "cypress.zip::https://download.cypress.io/desktop/$pkgver?os=linux64"
  'cypress.desktop'
)
sha512sums=('d5f48d95136a9b2d47667afcb6305a6b3b3ac4700c6818330f964700ecefe86712a5a01c6ff67ec2a4c231adc3f23a16460ea79e8a44aa5e7ccb908920355a46'
            '1b48157cf3ddd21ca58e2cd3df7998c01966a02a544fdfc7c5eedf5aee8757c541d5dc9df64fcdee65256a29141fa491c638bf9cd98b4e9df5030ec98ebc4251')

package() {
  mkdir "$pkgdir/opt"
  cp -a "$srcdir/Cypress" "$pkgdir/opt/Cypress"
  chmod 666 "$pkgdir/opt/Cypress/resources/app/node_modules/@cypress/core-extension/dist/background.js"
  install -Dm 644 cypress.desktop "$pkgdir/usr/share/applications/cypress.desktop"
  install -Dm 644 "$srcdir/Cypress/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 "$srcdir/Cypress/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}

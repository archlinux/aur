# Maintainer: Furkan Sahin furkansahin824@gmail.com
pkgname=vscode-js-debug
pkgver=1.90.0
pkgrel=1
pkgdesc="A VS Code debugger for JavaScript & TypeScript, powered by the Microsoft vscode-js-debug"
arch=('any')
url="https://github.com/microsoft/vscode-js-debug"
license=('MIT')
depends=('nodejs' 'npm')
makedepends=('git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/microsoft/vscode-js-debug/archive/refs/tags/v${pkgver}.tar.gz")
https://github.com/microsoft/vscode-js-debug/archive/refs/tags/v1.90.0.tar.gz
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  npm install --legacy-peer-deps
  npm run package
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  cp -r dist/* "${pkgdir}/usr/lib/${pkgname}/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

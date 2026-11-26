# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=vscli-bin
pkgver=1.3.3
pkgrel=1
pkgdesc="CLI and TUI for launching VS Code projects with a focus on dev containers"
arch=('x86_64')
url="https://github.com/michidk/vscli"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/michidk/vscli/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/vscli-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('508a77d2e7b51d98adeed32648ad124b7b30241a8e70b2e72c99f92d8e5874d1')
sha256sums_x86_64=('ccc7853560f113607713239886466bf1cce503aa439f96582df960c3a03c65f0')

package() {
  install -Dm755 "vscli-x86_64-unknown-linux-musl/vscli" "${pkgdir}/usr/bin/vscli"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

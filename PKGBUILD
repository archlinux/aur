# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=browser-control-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="A tiny, fast Rust CLI that drives a real browser over the Chrome DevTools Protocol built for coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/keon/browser-control"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/keon/browser-control/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/browser-control-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/browser-control-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('29a7ea052d6d2b2080a2c221786557a2c7cdade4826148cbba9a910d72d8e998')
sha256sums_x86_64=('40c9823488527ce56f358257d4644f8c616d6f10dd1f407f3a6d48482cc169d3')
sha256sums_aarch64=('d4c690b6ea2b87980310f0713cd2815f672bdb7705b8d12044b332e947117939')

package() {
  install -Dm755 "browser-control" "${pkgdir}/usr/bin/browser-control"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

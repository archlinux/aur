# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=nb-clean-bin
pkgver=6.0.0
pkgrel=1
pkgdesc="Clean Jupyter notebooks for version control"
arch=('x86_64' 'aarch64')
url="https://github.com/srstevenson/nb-clean"
license=('ISC')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/nb-clean-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/nb-clean-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('d038578e44576cc4e29b1dde68c8895a00efd9d77cd9bd51678057327f66e0ff')
sha256sums_aarch64=('4b7d665e1f69b15a7ad1a31f58895ed28f2a88021238cceb7bd19e4013ee68dd')

package() {
  install -Dm755 "nb-clean" "${pkgdir}/usr/bin/nb-clean"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

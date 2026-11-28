# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=procoder-bin
pkgver=3.9.5
pkgrel=1
pkgdesc="Senior-developer discipline for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/azrtydxb/procoder"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/azrtydxb/procoder/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/procoder-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/procoder-linux-arm64")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('09c84640ab66026096ea556964cf462acc77af9bd0467c2d5c89f0425f3a23fe')
sha256sums_aarch64=('ea8f32622078c7989c0e7cefda9642e709548c17f641c756ffbe5c1d0ef56807')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/procoder"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

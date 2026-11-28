# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mwb-linux-bin
pkgver=0.6.4
pkgrel=1
pkgdesc="Mouse Without Borders for Linux, sharing keyboard, mouse and clipboard with Windows"
arch=('x86_64' 'aarch64')
url="https://github.com/lucky-verma/mwb-linux"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/lucky-verma/mwb-linux/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/mwb-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/mwb-linux-arm64")
sha256sums=('1bcb1eafb6809c53bd056d59c8a42178191b19726253e687700ca1efb6676f85')
sha256sums_x86_64=('af7bc442c269430525b3958b19ca2ca96ea581defdb8e3ffbcd3e421db85d496')
sha256sums_aarch64=('2ecf65ae3ff6e12623074e7de41df0dc3b47fb127f043c4782a8a1dda547965d')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/mwb"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

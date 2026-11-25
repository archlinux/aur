# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=blitzar-bin
pkgver=1.115.3
pkgrel=1
pkgdesc="Zero-knowledge proof acceleration with GPUs for C++ and Rust"
arch=('x86_64')
url="https://github.com/spaceandtimefdn/blitzar"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/spaceandtimefdn/blitzar/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/libblitzar-linux-x86_64.so")
sha256sums=('5e865419e37fe3c7a51b8066f826d0a2dc59f0e86fbd3c7d97ef4ee47c294cd4')
sha256sums_x86_64=('7bb8059c86dfeeb940eef1688298bfbc524860841a6f4adc97f21db5de2bb430')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/libblitzar"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

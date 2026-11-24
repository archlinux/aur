# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rusty-amp-bin
pkgver=0.2.14
pkgrel=1
pkgdesc="Guitar amp and effects rig in the terminal"
arch=('x86_64')
url="https://github.com/danylokravchenko/rusty-amp"
license=('Apache-2.0')
depends=('alsa-lib' 'glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/danylokravchenko/rusty-amp/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/rusty-amp-linux-x86_64")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('4fa50bf986bd4a233a32523ff909e142f3245c4f589eadd4b1ef403eb9455d47')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/rusty-amp"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

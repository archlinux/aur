# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gogallery-bin
pkgver=7.1.0
pkgrel=1
pkgdesc="Static site generator for image galleries"
arch=('x86_64')
url="https://github.com/robrotheram/gogallery"
license=('Apache-2.0')
depends=('glibc' 'libglvnd' 'wayland')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/robrotheram/gogallery/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/gogallery-linux-amd64.tar.xz")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('4e101a47a741a3d4bdca4fb0cce0fb5c0009b773270939adaa65f7798f69f84d')

package() {
  install -Dm755 "gogallery/usr/local/bin/gogallery" "${pkgdir}/usr/bin/gogallery"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

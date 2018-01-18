# Contributor: Sebastian Wolf <swolf at melonkru dot de>
pkgname=xseticon
pkgver=0.1+bzr14
pkgrel=1
pkgdesc="Set the X11 window icon for any given window to that of a given image file"
arch=('i686' 'x86_64')
url="http://www.leonerd.org.uk/code/xseticon/"
depends=('gd')
makedepends=('libx11')
license=('GPL')
source=("http://www.leonerd.org.uk/code/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('048a8339b47030ebbff9cce4b58cb071a5c5f5a2cd7ff1ecc8434f95b2f8e4c5')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -m755 -d "${pkgdir}/usr/bin"
  install -m755 ${pkgname} "${pkgdir}/usr/bin/"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}

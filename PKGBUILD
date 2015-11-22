# Contributor: Sebastian Wolf <swolf at melonkru dot de>
pkgname=xseticon
pkgver=0.1+bzr13
pkgrel=1
pkgdesc="Set the X11 window icon for any given window to that of a given image file"
arch=('i686' 'x86_64')
url="http://www.leonerd.org.uk/code/xseticon/"
depends=('gd')
makedepends=('libx11')
license=('GPL')
source=("http://www.leonerd.org.uk/code/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6b568674643e13a3671bd74aaa8316f11721d48764a822f76d28b83a88d919b9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -m755 -d "${pkgdir}/usr/bin"
  install -m644 ${pkgname} "${pkgdir}/usr/bin/"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}

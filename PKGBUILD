pkgname=framecounter
pkgver=20140128
pkgrel=1
pkgdesc="A small program to count frames in RAW VC-1, MPEG-4 ASP and MPEG-4 AVC streams"
arch=('i686' 'x86_64')
license=('custom')
depends=('qt5-base')
url="http://www.selur.de/"
source=(http://www.selur.de/sites/default/files/hybrid_downloads/FrameCounter.7z)
md5sums=('02b1c2fbd672f5169b58957dd552fefb')

build() {
  cd "${srcdir}"/FrameCounter/FrameCounter/source
  qmake FrameCounter.pro
  make
}
package() {
  cd "${srcdir}"/FrameCounter/FrameCounter/source
  install -D -m755 FrameCounter "${pkgdir}"/usr/bin/FrameCounter
}

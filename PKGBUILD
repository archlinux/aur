pkgname=framecounter
pkgver=20171226
pkgrel=1
pkgdesc="A small program to count frames in RAW VC-1, MPEG-4 ASP and MPEG-4 AVC streams"
arch=('i686' 'x86_64')
license=('custom')
depends=('qt5-base')
makedepends=('git')
url="http://www.selur.de/"
_commit=0189dbfb3a1891c520746bf82aca78199b24fbb9
source=(git+https://github.com/Selur/FrameCounter.git#tag=$_commit)
sha256sums=(SKIP)

build() {
  cd "${srcdir}"/FrameCounter
  qmake FrameCounter.pro
  make
}
package() {
  cd "${srcdir}"/FrameCounter
  install -D -m755 FrameCounter "${pkgdir}"/usr/bin/FrameCounter
}

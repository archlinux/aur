# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Maintainer: anon at sansorgan.es 

pkgname=cherrytree
pkgver=0.99.13
pkgrel=1
pkgdesc="Hierarchical note-taking application"
arch=('x86_64')
url="https://www.giuspen.com/cherrytree/"
license=('GPL3')
depends=('gspell'
	 'gtksourceviewmm'
	 'libxml++2.6')
makedepends=('cmake'
	     'python-lxml')
source=("https://www.giuspen.com/software/${pkgname}_${pkgver}.tar.xz")
sha256sums=('716e627777c46b5b9b41ede082fb27f3466905021fd95c661cd00365274b7d7e')

build() {
  cmake \
	-B "${pkgname}_${pkgver}/build" \
	-S "${pkgname}_${pkgver}" \
	-DBUILD_TESTING:BOOL=OFF \
	-Wno-dev
  make -C "${pkgname}_${pkgver}/build"
}

package() {
  make -C "${pkgname}_${pkgver}/build" DESTDIR="${pkgdir}" install
}

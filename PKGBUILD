# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Maintainer: anon at sansorgan.es 

pkgname=cherrytree
pkgver=0.99.14
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/giuspen/cherrytree/archive/${pkgver}.tar.gz")
sha256sums=('5bc7d5aeb34a77e8756fc6f19c1769ded403f86a2aa89d348f7a3fe34dd4aec5')

build() {
  cmake \
	-B "${pkgname}-${pkgver}/build" \
	-S "${pkgname}-${pkgver}" \
	-DBUILD_TESTING:BOOL=OFF \
	-Wno-dev
  make -C "${pkgname}-${pkgver}/build"
}

package() {
  make -C "${pkgname}-${pkgver}/build" DESTDIR="${pkgdir}" install
}

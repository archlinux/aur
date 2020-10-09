# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Maintainer: anon at sansorgan.es 

pkgname=cherrytree
pkgver=0.99.15
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
sha256sums=('aa446ca38ad3071a217b9515a49ed02c98fdb4be50587282e988f5f5d54e1043')

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

# Maintainer: lantw44 (at) gmail (dot) com

pkgname=guile-git-lib
_pkgname=guile-git
pkgver=0.1.0
pkgrel=1
pkgdesc='Guile bindings for libgit2'
arch=('x86_64' 'i686' 'armv7h')
url="https://gitlab.com/guile-git/guile-git"
license=('GPL3')
depends=('guile' 'guile-bytestructures' 'libgit2')
makedepends=('git')
source=("https://gitlab.com/${_pkgname}/${_pkgname}/uploads/e8c218ac7ae77b745c44d1ffbe34f1dd/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('a119e6fb2812d1d60d47b4554ca22b433586589fc2fbc4dd380b724020dfa356')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

check() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make check
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

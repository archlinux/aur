# Maintainer: lantw44 (at) gmail (dot) com

pkgname=guile-git-lib
_pkgname=guile-git
pkgver=0.3.0
pkgrel=1
pkgdesc='Guile bindings for libgit2'
arch=('x86_64' 'i686' 'armv7h')
url="https://gitlab.com/guile-git/guile-git"
license=('GPL3')
depends=('guile' 'guile-bytestructures' 'libgit2')
makedepends=('git')
source=("https://gitlab.com/${_pkgname}/${_pkgname}/uploads/4c563d8e7e1ff84396abe8ca7011bcaf/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('75ce437da024fa57d6a2a48ae4e05d48cb42d84f73a3d372baef5c68421bb130')

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

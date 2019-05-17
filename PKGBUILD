# Maintainer: lantw44 (at) gmail (dot) com

pkgname=guile-git-lib
_pkgname=guile-git
pkgver=0.2.0
pkgrel=1
pkgdesc='Guile bindings for libgit2'
arch=('x86_64' 'i686' 'armv7h')
url="https://gitlab.com/guile-git/guile-git"
license=('GPL3')
depends=('guile' 'guile-bytestructures' 'libgit2')
makedepends=('git')
source=("https://gitlab.com/${_pkgname}/${_pkgname}/uploads/160f6a36c1be8d4fc1990a193081a04d/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('53793fce5e6cbf4502974f0bee802de108abdf101af63bfb5cee71f7d37e4fa1')

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

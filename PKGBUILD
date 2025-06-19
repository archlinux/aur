# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: lantw44 (at) gmail (dot) com

pkgname=guile-git-lib
_pkgname=guile-git
pkgver=0.10.0
pkgrel=1
pkgdesc='guile bindings of libgit2'
arch=('x86_64' 'i686' 'armv7h')
url="https://gitlab.com/guile-git/guile-git"
license=('GPL3')
depends=('guile' 'guile-bytestructures' 'libgit2>=1.3.0')
makedepends=('git')
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/${_pkgname}/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('97966a8fb862bf50eb200c92a75039fc655e169a76dcb929e7e6ca3d81b493fc')

build() {
	cd "${srcdir}/${_pkgname}-v${pkgver}"
	autoreconf -fi
	./configure --prefix=/usr
	make
}

#check() {
#	cd "${srcdir}/${_pkgname}-v${pkgver}"
#	make check
#}

package() {
	cd "${srcdir}/${_pkgname}-v${pkgver}"
	make DESTDIR="${pkgdir}" install
}

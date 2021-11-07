# Maintainer: lantw44 (at) gmail (dot) com

pkgname=guile-git-lib
_pkgname=guile-git
pkgver=0.5.2
pkgrel=1
pkgdesc='Guile bindings for libgit2'
arch=('x86_64' 'i686' 'armv7h')
url="https://gitlab.com/guile-git/guile-git"
license=('GPL3')
depends=('guile' 'guile-bytestructures' 'libgit2>=0.28.0')
makedepends=('git')
source=(
	"${pkgname}-${pkgver}.tar.gz::https://gitlab.com/${_pkgname}/${_pkgname}/uploads/6450f3991aa524484038cdcea3fb248d/${_pkgname}-${pkgver}.tar.gz")
sha256sums=(
	'949755a211ad6e905ecdebe66ca35bfaab638d985b9fadc928ad2538d8f5cc95')

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

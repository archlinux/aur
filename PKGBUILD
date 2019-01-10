#Maintainer: Iru Cai <mytbk920423@gmail.com>

pkgname='libgoldilocks-git'
_pkgname='libgoldilocks'
pkgver=644.045bec4
pkgrel=1
pkgdesc="An implementation of Mike Hamburg's Ed448 (Goldilocks) curve"
arch=('i686' 'x86_64')
url='https://github.com/otrv4/libgoldilocks'
license=('MIT')
depends=()
source=('git+https://github.com/otrv4/libgoldilocks.git')
sha256sums=('SKIP')

build() {
	cd "${srcdir}/${_pkgname}"

	autoreconf --install
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install
}

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

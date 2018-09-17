#Maintainer: Iru Cai <mytbk920423@gmail.com>

pkgname='libgoldilocks'
pkgver=642.55578ef
pkgrel=1
pkgdesc="An implementation of Mike Hamburg's Ed448 (Goldilocks) curve"
arch=('i686' 'x86_64')
url='https://github.com/otrv4/libgoldilocks'
license=('MIT')
depends=()
source=('git+https://github.com/otrv4/libgoldilocks.git')
sha256sums=('SKIP')

build() {
	cd "${srcdir}/${pkgname}"

	autoreconf --install
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}" install
}

pkgver() {
	cd "${srcdir}/${pkgname}"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

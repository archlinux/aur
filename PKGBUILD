# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=uinit
pkgver=20171230git
_commit=8c11abef
pkgrel=1
pkgdesc="uinit -- smallest init possible"
arch=('i686' 'x86_64')
url="https://github.com/shiftypenguin/uinit"
license=('custom:unlicense')
makedepends=('git')
source=("git+https://github.com/shiftypenguin/uinit.git#commit=${_commit}")
sha512sums=('SKIP')

build() {
	cd "${srcdir}/${pkgname}"

	make
}

package(){
	cd "${srcdir}/${pkgname}"

	install -d -m0755 ${pkgdir}/{usr,sbin}

	make DESTDIR="${pkgdir}" install

	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	mv ${pkgdir}/sbin ${pkgdir}/usr/.
}

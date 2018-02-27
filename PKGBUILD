# Maintainer: Ankit R Gadiya <arch@argp.in>

pkgname='sbm'
pkgver=0.9
pkgrel=1
pkgdesc="simple bandwidth monitor"
url="http://git.2f30.org/sbm"
license=('custom:MIT/X Consortium')
source=("git://git.2f30.org/sbm.git")
sha512sums=('SKIP')
arch=('x86_64')
makedepends=('git')

prepare() {
	cd "${pkgname}"
	git checkout "${pkgver}"
}

build() {
	cd "${pkgname}"
	make
}

package() {
	cd "${pkgname}"
	make DESTDIR="${pkgdir}" PREFIX="/usr" install

	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

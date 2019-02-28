# Maintainer: Tilman Vatteroth <tilman.vatteroth@udo.edu>
pkgname=uniprint-git
pkgver=a0a8eb9
pkgrel=1
pkgdesc="A shell script to print on the printers on IRB printers of the TU Dortmund"
arch=(any)
url="https://github.com/mrdrogdrog/uniprint"
license=('MIT')
depends=(bash openssh)
makedepends=('git')
provides=("uniprint")
conflicts=("uniprint")
source=($pkgname::git+https://github.com/mrdrogdrog/uniprint.git)
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "%s" "$(git rev-parse --short HEAD)"
}

package() {
	mkdir -p ${pkgdir}/usr/share/uniprint
	mkdir -p ${pkgdir}/usr/bin
	cp ${srcdir}/${pkgname}/uniprint ${pkgdir}/usr/bin/uniprint
	cp ${srcdir}/${pkgname}/example.conf ${pkgdir}/usr/share/uniprint/example.conf
	chmod +x ${srcdir}/${pkgname}/uniprint
}

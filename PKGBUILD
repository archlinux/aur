# Maintainer: Morgana <morganamilo@gmail.com>

pkgname=pep8
pkgver=8.1.3
pkgrel=1
pkgdesc="Pep/8 assembler and simulator"
arch=("x86_64")
url="http://computersystemsbook.com/4th-edition/pep8/"
license=('GPL')
depends=('qt5-webengine')
source=("git+https://github.com/StanWarford/${pkgname}")
provides=('pep8')
conflicts=('pep8')
md5sums=('SKIP')

build() {
	cd ${srcdir}/${pkgname} 
	qmake pep8.pro
	make
}

pkgver() {
	cd ${pkgname}
	cat aboutpep.ui | grep -om1 'version [0-9\.]\+' | cut -d " " -f 2
}

package() {
	cd ${pkgname}
	install -Dm755 Pep8 "${pkgdir}/usr/bin/pep8"
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}


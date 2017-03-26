# Maintainer: Pierre CHOFFET <pierre@choffet.net>
pkgname=qdictionnaire
pkgver=3.0
pkgrel=1
epoch=
pkgdesc="Collection of dictionnaries in french language"
arch=(i686 x86_64)
url="http://www.gillesmaire.com/tiki-index.php?page=qdictionnaire"
license=('GPL')
groups=()
depends=(qt5-base)
makedepends=(qt5-base)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git://git.code.sf.net/p/dicorime/qdicorime")
noextract=()
md5sums=('SKIP') # generate with 'makepkg -g'

build() {
	cd qdicorime/qdictionnaire-${pkgver}
	qmake -makefile
	make
}

package() {
	mkdir -p ${pkgdir}/usr/bin
	cp ${srcdir}/qdicorime/qdictionnaire-${pkgver}/bin/qdictionnaire ${pkgdir}/usr/bin/

	mkdir -p ${pkgdir}/usr/share/qdictionnaire/
	cp ${srcdir}/qdicorime/qdictionnaire-${pkgver}/base/qdictionnaire.db ${pkgdir}/usr/share/qdictionnaire/
}

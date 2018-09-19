# Maintainer: Matthijs Tadema <M dot J dot Tadema at gmail dot com>
pkgname=python2-insane
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="Tool for constructing MARTINI coarse grained lipid bilayers in python"
arch=("any")
url="http://cgmartini.nl/index.php/tools2/proteins-and-bilayers"
license=('unknown')
depends=("python2")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("insane.py:http://cgmartini.nl/images/tools/insane/insane.py")
noextract=()
md5sums=('2e2404990022ba15bf32097d5b5800f4')
validpgpkeys=()

prepare() {
	cd "$srcdir"
	echo -e "
#!/bin/bash
python2 /opt/insane/insane.py \$@

" > insane.sh
}

#build() {
#}
#
#check() {
#}

package() {
	cd "$pkgdir"
	mkdir -p ./opt/insane/ ./usr/bin
	cd "$srcdir"
	cp ./insane.py "$pkgdir"/opt/insane
	cp ./insane.sh "$pkgdir"/usr/bin/insane
	chmod +x "$pkgdir"/usr/bin/insane
}

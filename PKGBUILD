# Maintainer: nastypriest <priest@airmail.cc>
pkgname=pscrot
pkgver=1.0
pkgrel=1
pkgdesc="Take screenshot with scrot and upload it to pomf.cat,pomf.se or any other pomf clone."
arch=(any)
license=('GPL')
depends=(curl jq scrot xclip)
provides=(pscrot)
conflicts=(pscrot)
noextract=()
validpgpkeys=()

build() {
	mv ../pscrot .
	chmod +x pscrot
}
check() {
	./pscrot h
	./pscrot fd
	echo "[[ Testing: Passed ]]"
}

package(){
	mkdir -p $pkgdir/usr/local/bin
	mv $srcdir/pscrot $pkgdir/usr/local/bin/
	echo $pkgdir
}

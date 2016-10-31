# Maintainer: ebs <ebs@openmailbox.org>
# Based on pscrot by nastypriest <priest@airmail.cc>

pkgname=pscrotum
pkgver=1.0
pkgrel=1
pkgdesc="Take screenshot with escrotum and upload it to pomf.cat,pomf.se or any other pomf clone." 
arch=(any)
license=('GPL')
depends=(curl jq escrotum xclip)
provides=(pscrotum)
conflicts=(pscrotum)
noextract=()
validpgpkeys=()

build() {
	cp ../pscrotum .
	chmod +x pscrotum
}
check() {
	./pscrotum h
	./pscrotum fd
	echo "[[ Testing: Passed ]]"
}

package() {
	mkdir -p $pkgdir/usr/bin
	mv $srcdir/pscrotum $pkgdir/usr/bin/
	echo $pkgdir
}

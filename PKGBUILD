#Maintainer: Rick Chamblee <rchamblee@tutanota.de>
pkgname=xim
pkgver=1.0
pkgrel=1
pkgdesc="Manage multiple xinitrc configs."
arch=(any)
license=('GPLV2')
depends=()
provides=(xim)
conflicts=(xim)
noextract=()
validpgpkeys=()

build() {
	mv ../xim .
        mv ../license.txt .
	chmod +x xim
}
check() {
        ./xim
        echo "[[ Testing: Passed ]]"
}

package(){
        mkdir -p $pkgdir/usr/local/bin
	mkdir -p $pkgdir/usr/share/licenses/xim
	mv $srcdir/license.txt $pkgdir/usr/share/licenses/xim/LICENSE
        mv $srcdir/xim $pkgdir/usr/local/bin/
        echo $pkgdir
}



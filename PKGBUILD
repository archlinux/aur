# Maintainer: Develoopeer https://github.com/develoopeer/
pkgname=rofi-translater
pkgver=0.1.0
pkgrel=1
pkgdesc=""
arch=("any")
url="https://github.com/develoopeer/rofi-translater/"
license=('GPL')

build() {
	cd $BUILDDIR/src/
	go build
}

package(){
	mkdir -p ~/.config/ttr/
	cd $BUILDDIR/src/
	install -Dm755 ttr "$pkgdir"/usr/bin/ttr
	cd $BUILDDIR/
	cp launch.sh $pkgdir/
	cp -r assets/ $pkgdir/
	cp $pkgdir/launch.sh ~/.config/ttr/
	cp -r $pkgdir/assets/ ~/.config/ttr/
}

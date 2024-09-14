# Maintainer: Develoopeer https://github.com/develoopeer/
pkgname=rofi-translater
pkgver=0.1.0
pkgrel=1
pkgdesc=""
arch=("any")
url="https://github.com/develoopeer/rofi-translater/"
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
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
sha256sums=('1845d4dfff3bd95b560708069b6ce596a3d3121cb9f5510918c5616e240c155c')

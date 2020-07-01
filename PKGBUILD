#Maintainer: Skykey <zcxzxlc@163.com>

pkgname=('pkgbuild-assistant')
pkgver=2.2.0
pkgrel=1
pkgdesc="An auxiliary tool for writing PKGBUILD files"
provides=("pkgbuild-assistant")
url='https://github.com/skykeyjoker/PKGBUILD-Assistant'
arch=('x86_64')

depends=('qt5-base' 'harfbuzz' 'tree' 'pacman-contrib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
)
sha512sums=('da349cc4df7f45d5159fcbf72628c573aba6098f8a7d0a504bb492cbbdae36f1d1c3cd99c5a51cabe0926310f79dcb431047a48453be413b3395d9969fcded13'
)

build(){
    cd "PKGBUILD-Assistant-$pkgver"
	qmake
	make
}

package(){
	 cd "PKGBUILD-Assistant-$pkgver"
	install -Dm755 PKGBUILD_ASSISTANT "$pkgdir/usr/bin/$pkgname"
	install -Dm644 ico.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications"
}

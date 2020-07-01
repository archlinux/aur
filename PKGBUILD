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
sha512sums=('c1e06f4757bd85dd5506da37a24666f63b60c6d7d3b82ac70e65cc51739c83bfe762a81f8f7b7b1c1da94f569fbe4a9ce680889ba747f84aa7a0c0466bf0acdf'
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

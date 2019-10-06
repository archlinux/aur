# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
# Contributor: LinArcx <linarcx at gmail.com>
pkgname=kindd
pkgver=2.0.1
pkgrel=4
pkgdesc=" A Kindful dd gui written in qt quick"
arch=('any')
url="https://github.com/LinArcX/Kindd"
license=('GPL3')
depends=('polkit' 'qt5-multimedia' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-graphicaleffects' 'qt5-svg')
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/LinArcX/Kindd/archive/$pkgver.tar.gz")
sha256sums=('5dbfcbc07cdc36a6a5d2b40ed5e8159a305ccc5608580635961ed9ad6f43e2b3')

build() {
	cd "Kindd-$pkgver"
	qmake
	make
}

package() {
	cd "Kindd-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 appconf/"$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 appconf/"$pkgname.svg" "$pkgdir/usr/share/pixmaps/kindd.svg"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


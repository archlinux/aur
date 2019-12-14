# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
# Contributor: LinArcx <linarcx at gmail.com>
pkgname=kindd
pkgver=2.0.1
pkgrel=6
pkgdesc="A Kindful dd GUI written in Qt Quick"
arch=('any')
url="https://github.com/LinArcX/Kindd"
license=('GPL3')
depends=('polkit' 'qt5-quickcontrols' 'qt5-quickcontrols2'
         'qt5-graphicaleffects' 'qt5-svg')
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('5dbfcbc07cdc36a6a5d2b40ed5e8159a305ccc5608580635961ed9ad6f43e2b3')

build() {
	cd "Kindd-$pkgver"
	qmake
	make
}

package() {
	cd "Kindd-$pkgver"
	install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 appconf/"$pkgname.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm644 appconf/"$pkgname.svg" -t \
		"$pkgdir/usr/share/icons/hicolor/scalable/apps"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}


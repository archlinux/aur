# Maintainer: chocolateimage <chocolateimage@protonmail.com>
pkgname=qrhythmcafe
pkgver=1.1.0
pkgrel=1
pkgdesc="A desktop version of rhythm.cafe to download levels directly into the Rhythm Doctor levels folder"
url="https://github.com/chocolateimage/qrhythmcafe"
license=('GPL-3.0-only')
arch=("x86_64")
depends=(
	'python'
	'python-pyqt6'
	'python-requests'
	'python-pyyaml'
	'python-gobject'
	'glib2'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/chocolateimage/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('80154681f8d3e1138d88e5745249538030881f10fd59037a3f6c45543a6deed1')

package() {
	cd "$pkgname-$pkgver"

	install -dm755 "$pkgdir/usr/bin/"
	install -dm755 "$pkgdir/usr/share/qrhythmcafe"
	install -dm755 "$pkgdir/usr/share/applications"
	install -dm755 "$pkgdir/usr/share/mime/packages"

	install -m755 "deb/runner.sh" "$pkgdir/usr/bin/qrhythmcafe"

	cp *.py "$pkgdir/usr/share/qrhythmcafe/"
	cp -r "ui" "$pkgdir/usr/share/qrhythmcafe/"

	cp "deb/qrhythmcafe.desktop" "$pkgdir/usr/share/applications/"

	cp "deb/mime.xml" "$pkgdir/usr/share/mime/packages/qrhythmcafe.xml"
}

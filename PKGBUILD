# Maintainer: chocolateimage <chocolateimage@protonmail.com>
pkgname=qrhythmcafe
pkgver=1.0.1
pkgrel=1
pkgdesc="A desktop version of rhythm.cafe to download levels directly into the Rhythm Doctor levels folder"
url="https://github.com/chocolateimage/qrhythmcafe"
license=('GPL-3.0-only')
arch=("x86_64")
depends=(
	'python'
	'python-pyqt6'
	'python-requests'
	'python-gobject'
	'glib2'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/chocolateimage/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4271566d295f38d2f57a6b88c42ae55faf2cf3d668f6bbc282bdced3fb3323ca')

package() {
	cd "$pkgname-$pkgver"

	install -dm755 "$pkgdir/usr/bin/"
	install -dm755 "$pkgdir/usr/share/qrhythmcafe"
	install -dm755 "$pkgdir/usr/share/applications"

	install -m755 "deb/runner.sh" "$pkgdir/usr/bin/qrhythmcafe"

	cp *.py "$pkgdir/usr/share/qrhythmcafe/"
	cp -r "ui" "$pkgdir/usr/share/qrhythmcafe/"

	cp "deb/qrhythmcafe.desktop" "$pkgdir/usr/share/applications/"
}

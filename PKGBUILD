# Maintainer: Hans Gaiser <hansg91@gmail.com>

pkgname=ids-peak
pkgdesc="IDS peak is a modern, free software development kit for all USB3 Vision and GigE Vision compliant industrial cameras from any manufacturer."
pkgver=1.2.1
pkgrel=2
arch=(x86_64)
license=(custom)
url="https://en.ids-imaging.com/ids-peak.html"
depends=('libusb' 'qt5-base' 'hicolor-icon-theme')

source=(
	"https://en.ids-imaging.com/files/downloads/ids-peak/software/linux-desktop/ids-peak-linux-x86-$pkgver.0-64.tgz"
	"ids-peak.rules"
)
sha512sums=('983cd8676b9a759b017eef0ea81f916b6743abc7f976cad6545066dbf6b1212e33e4368d0534e84ea89ebafc74b14e7093ed48cd3b9080fc2dca5aabee8c9239'
            'c92de0fa8f5c95ae95a715f70b6dfedb86a566eb80a9b090bb604785837e39ef40e3896d5e8f1f9271647958b87e4cef42dc0ed3a14cc4a1dd77c560d1ad5c4b')

_dir="ids_peak_$pkgver.0-8984_x86_64"

package() {
	mkdir "$pkgdir/usr"
	cp -R "$srcdir/$_dir/bin"     "$pkgdir/usr"
	cp -R "$srcdir/$_dir/include" "$pkgdir/usr"
	cp -R "$srcdir/$_dir/lib"     "$pkgdir/usr"
	cp -R "$srcdir/$_dir/share"   "$pkgdir/usr"

	install -D -m 644 "$srcdir/ids-peak.rules" -t "$pkgdir/usr/lib/udev/rules.d"
}

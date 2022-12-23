# Maintainer: Hans Gaiser <hansg91@gmail.com>

pkgname=ids-peak
pkgdesc="IDS peak is a modern, free software development kit for all USB3 Vision and GigE Vision compliant industrial cameras from any manufacturer."
pkgver=2.3.0
pkgrel=1
arch=(x86_64)
license=(custom)
url="https://en.ids-imaging.com/ids-peak.html"
depends=('libusb' 'qt5-base' 'hicolor-icon-theme')

source=(
	"https://en.ids-imaging.com/files/downloads/ids-peak/software/linux-desktop/ids-peak-linux-x86-$pkgver.0-64.tgz"
	"ids-peak.rules"
)
sha512sums=('b4b05b449940f98a0338740a5383eb80b8e93874783ffdda4b30e8386e6cb7252184a304028a25b5f06f2277814b90e92ca26b2ce4b82adfe4e47453f19cb4e4'
            'c92de0fa8f5c95ae95a715f70b6dfedb86a566eb80a9b090bb604785837e39ef40e3896d5e8f1f9271647958b87e4cef42dc0ed3a14cc4a1dd77c560d1ad5c4b')

_dir="ids-peak_$pkgver.0-15823_amd64"

package() {
	mkdir "$pkgdir/usr"
	cp -R "$srcdir/$_dir/bin"     "$pkgdir/usr"
	cp -R "$srcdir/$_dir/include" "$pkgdir/usr"
	cp -R "$srcdir/$_dir/lib"     "$pkgdir/usr"
	cp -R "$srcdir/$_dir/share"   "$pkgdir/usr"

	install -D -m 644 "$srcdir/ids-peak.rules" -t "$pkgdir/usr/lib/udev/rules.d"
}

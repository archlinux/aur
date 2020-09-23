# Maintainer: Hans Gaiser <hansg91@gmail.com>

pkgname=ids-peak
pkgdesc="IDS peak is a modern, free software development kit for all USB3 Vision and GigE Vision compliant industrial cameras from any manufacturer."
pkgver=1.1.8
pkgrel=1
arch=(x86_64)
license=(custom)
url="https://en.ids-imaging.com/ids-peak.html"
depends=('libusb' 'qt5-base' 'hicolor-icon-theme')

source=("https://en.ids-imaging.com/files/downloads/ids-peak/software/linux-desktop/ids-peak-linux-x86-$pkgver.0-64.tgz")
sha512sums=('a014ce1e83def8603845f47ce2319e43216e6baf4dde2233f2c737c32389eafadac52542ab8189596e700f016d34bdadc4a2c284606bcc80458ad3841c212ed3')

_dir="ids_peak_$pkgver.0-6297_x86_64"

package() {
	mkdir "$pkgdir/usr"
	cp -R "$srcdir/$_dir/bin"     "$pkgdir/usr"
	cp -R "$srcdir/$_dir/include" "$pkgdir/usr"
	cp -R "$srcdir/$_dir/lib"     "$pkgdir/usr"
	cp -R "$srcdir/$_dir/share"   "$pkgdir/usr"

	install -D -m 644 "$srcdir/$_dir/local/scripts/99-ids-usb-access.rules" -t "$pkgdir/usr/lib/udev/rules.d"
}

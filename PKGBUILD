# Maintainer: Hans Gaiser <hansg91@gmail.com>

pkgname=ids-peak
pkgdesc="IDS peak is a modern, free software development kit for all USB3 Vision and GigE Vision compliant industrial cameras from any manufacturer."
pkgver=2.7.1
_pkgver="$pkgver.0-16417"
pkgrel=1
arch=(x86_64)
license=(custom)
url="https://en.ids-imaging.com/ids-peak.html"
depends=('libusb' 'qt5-base' 'qt5-multimedia' 'hicolor-icon-theme')

source=(
	"https://en.ids-imaging.com/files/downloads/ids-peak/software/linux-desktop/ids-peak_${_pkgver}_amd64.tgz"
	"ids-peak.rules"
	"ids-peak-sysusers.conf"
)
sha512sums=('de579e0c94fda6b7359be8a1513376bcad436ec2c329532b003505399ebb232d5a16897d059666da8bcf88e6389d6c2b1daf45798daad012f41cd687890afbb1'
            'c92de0fa8f5c95ae95a715f70b6dfedb86a566eb80a9b090bb604785837e39ef40e3896d5e8f1f9271647958b87e4cef42dc0ed3a14cc4a1dd77c560d1ad5c4b'
            '05b961501a56b1827986aabc2a5ea8320b711fb0089615b212711814906c52af51205f04ffd9df436510362b185911797176bb6ed71bec4e35db8b1cd4d1f408')

_dir="ids-peak_${_pkgver}_amd64"

package() {
	mkdir "$pkgdir/usr"
	cp -R "$srcdir/$_dir/bin"     "$pkgdir/usr"
	cp -R "$srcdir/$_dir/include" "$pkgdir/usr"
	cp -R "$srcdir/$_dir/lib"     "$pkgdir/usr"
	cp -R "$srcdir/$_dir/share"   "$pkgdir/usr"

	install -D -m 644 "$srcdir/ids-peak.rules" -t "$pkgdir/usr/lib/udev/rules.d"
	install -D -m 644 "$srcdir/ids-peak-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/ids-peak-sysusers.conf"
}

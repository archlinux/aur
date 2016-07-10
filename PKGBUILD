# Maintainer: Jaro Habiger <jarohabiger@gmail.com>
# Contributor: Jaro Habiger <robin.ole.heinemann@gmail.com>

pkgname=hterm
pkgver=0.8.1
pkgrel=1
pkgdesc="HTerm serial terminal"
arch=("i686" "x86_64")
url="http://www.der-hammer.info/terminal"
license=(properitary)
depends=("lib32-gtk2")
optdepends=()
conflicts=()

source=("hterm.png" "hterm.desktop" "http://www.der-hammer.info/terminal/hterm.tar.gz")
sha256sums=('358862a79e6a88ca07dc86faa5e29d862bbf2aa2ca16e7f43e2f00a8c444e683'  
	    'fba0a7159c9187bfe8d2c7f63611bf4c2193a69566566bca79f2ce3ff46073f7'  
	    'a329b7f671da73bbffaa3ff828db299ba8e4a52415777ed41d24bb6780647c7a')

package() {
	_source_arch="x86"

	install -d "$pkgdir"/usr/bin
	cp "$srcdir"/hterm "$pkgdir"/usr/bin/hterm

	chmod 755 "$pkgdir"/usr/bin/hterm

	install -Dm644 "$srcdir"/hterm.desktop "$pkgdir"/usr/share/applications/hterm.desktop
	install -Dm644 "$srcdir"/hterm.png "$pkgdir"/usr/share/pixmaps/hterm.png
}

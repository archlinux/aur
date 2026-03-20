# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=capo-nodi
_repo=CapoNodi
pkgbase=$_name-font
pkgname=(otf-$_name ttf-$_name)
pkgver=1.102
pkgrel=2
pkgdesc='Dropcaps derivative font — pg. 16 of 1880 Muster-Alphabete'
arch=(any)
url="https://m-casanova.codeberg.page/${_repo}/"
_url="https://codeberg.org/m-casanova/${_repo}"
license=(OFL)
_archive="${_repo,,}-$pkgver"
source=("$_archive-$pkgrel.tar.gz::$_url/archive/v$pkgver.tar.gz")
sha256sums=('50c17f04213aabc0e85cac44ad060624b4c432297f061617cd19295d51da1c93')

package_otf-capo-nodi() {
	cd "${_repo,,}"
	provides=("$pkgbase")
	install -Dm0644 -t "$pkgdir/usr/share/fonts/OTF/" font/*.otf
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}

package_ttf-capo-nodi() {
	cd "${_repo,,}"
	provides=("$pkgbase")
	install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" font/*.ttf
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}

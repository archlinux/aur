# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=capo-nodi
_repo=CapoNodi
pkgbase=$_name-font
pkgname=(otf-$_name ttf-$_name)
pkgver=1.103
pkgrel=1
pkgdesc='Dropcaps derivative font — pg. 16 of 1880 Muster-Alphabete'
arch=(any)
url="https://m-casanova.codeberg.page/${_repo}/"
_url="https://codeberg.org/m-casanova/${_repo}"
license=(OFL)
_archive="${_repo,,}-$pkgver"
source=("$_archive-$pkgrel.tar.gz::$_url/archive/v$pkgver.tar.gz")
sha256sums=('0964261b0fc50c877f7a61746daf4af21b32fe012bd0562766e6ae13798f76da')

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

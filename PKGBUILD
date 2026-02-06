# Maintainer: Caleb Maclennan <caleb@alerque.com>

_sha=3c0c3eca9c9c0dea0f6160652bd3bc138572644b

_name=garamontio-capo
_repo=GaramontioCapo
pkgbase=$_name-font
pkgname=(otf-$_name ttf-$_name)
pkgver=2.101
pkgrel=1
pkgdesc='Dropcaps for Garamontio'
arch=(any)
url="https://m-casanova.codeberg.page/${_repo}/"
_url="https://codeberg.org/m-casanova/${_repo}"
license=(OFL)
_archive="${_repo,,}-$pkgver"
source=("$_archive.tar.gz::$_url/archive/$_sha.tar.gz")
sha256sums=('155152fb46736b302a7dc5e00d7f677fce1a54aae84766553794b2b58fea9ccf')

package_otf-garamontio-capo() {
	cd "${_repo,,}"
	provides=("$pkgbase")
	install -Dm0644 -t "$pkgdir/usr/share/fonts/OTF/" font/*.otf
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}

package_ttf-garamontio-capo() {
	cd "${_repo,,}"
	provides=("$pkgbase")
	install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" font/*.ttf
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}

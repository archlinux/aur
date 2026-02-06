# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=garamontio-capo
_repo=GaramontioCapo
pkgbase=$_name-font
pkgname=(otf-$_name ttf-$_name)
pkgver=2.101
pkgrel=2
pkgdesc='Dropcaps for Garamontio'
arch=(any)
url="https://m-casanova.codeberg.page/${_repo}/"
_url="https://codeberg.org/m-casanova/${_repo}"
license=(OFL)
_archive="${_repo,,}-$pkgver"
source=("$_archive-$pkgrel.tar.gz::$_url/archive/v$pkgver.tar.gz")
sha256sums=('b39e4c78aed4caf73506618b0120204cf91a4fb926166ddcec343993e1b99c80')

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

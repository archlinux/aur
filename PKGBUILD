# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=padauk
pkgname=ttf-sil-$_pkgname
_fname=${_pkgname^}
pkgver=5.000
pkgrel=1
pkgdesc='Unicode font that supports the many diverse languages that use the Myanmar script'
arch=(any)
url="https://software.sil.org/$_pkgname"
license=(OFL)
conflicts=('ttf-sil-fonts<=6')
_archive="$_fname-$pkgver"
source=("http://software.sil.org/downloads/r/$_pkgname/$_archive.zip")
sha256sums=('f2c0aed534c13315cdb7ba4211ca6cccf2a5cf644208a00c5c2cc485cc19d51b')

package() {
	cd "$_archive"
	find -type f -name "$_fname*.ttf" -execdir \
		install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" {} \;
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.txt FONTLOG.txt documentation/*.pdf
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}

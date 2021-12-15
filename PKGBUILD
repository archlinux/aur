# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=nuosu
pkgname=ttf-sil-$_pkgname
_fname=${_pkgname^}SIL
pkgver=2.200
pkgrel=1
pkgdesc='Unicode font for the standardized Yi script'
arch=(any)
url="https://software.sil.org/$_pkgname"
license=(OFL)
conflicts=('ttf-sil-fonts<=6')
_archive="$_fname-$pkgver"
source=("http://software.sil.org/downloads/r/$_pkgname/$_archive.zip")
sha256sums=('db6db52db1eac2c1e89d4434504e4300238686773c2a69708cc233f893aefce4')

package() {
	cd "$_archive"
	find -type f -name "$_fname*.ttf" -execdir \
		install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" {} \;
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" FONTLOG.txt
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}

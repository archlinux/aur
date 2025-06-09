# Maintainer: Anton Leontiev <scileont /at/ gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Baptiste Grenier <baptiste@bapt.name>

_pkgname=andika
pkgname=ttf-$_pkgname
pkgver=7.000
pkgrel=2
pkgdesc='A sans serif, Unicode-compliant font designed especially for literacy use'
url="https://software.sil.org/$_pkgname"
arch=(any)
license=(OFL-1.1-RFN)
conflicts=('ttf-sil-fonts<=6')
_archive="${_pkgname^}-$pkgver"
source=("http://software.sil.org/downloads/r/$_pkgname/$_archive.zip")
sha256sums=('88ba6ea41ef4a8e5214b090df8fa2983be1babe4843efaa99cdb6078b0e2c070')

package() {
	cd "$_archive"
	install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" ${_pkgname^}-*.ttf
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.txt FONTLOG.txt documentation/pdf/*.pdf
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}

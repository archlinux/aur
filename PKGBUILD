# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: bslackr <brendan at vastactive dot com>
# Contributor: Firmicus <firmicus āt gmx dōt net>

_pkgname=lateef
pkgname=ttf-sil-$_pkgname
_fname=${_pkgname^}
pkgver=4.200
pkgrel=1
pkgdesc='An Arabic script font for Sindhi and other languages of southern Asia'
arch=(any)
url="https://software.sil.org/$_pkgname"
license=(OFL-1.1-RFN)
_archive="$_fname-$pkgver"
source=("https://software.sil.org/downloads/r/$_pkgname/$_archive.zip")
sha256sums=('aab697ad2bcc82baa72a7083b2ab1d0a503bc74806d49c54ffb5bcdaab58e36f')

package() {
	cd "$_archive"
	install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.txt FONTLOG.txt documentation/pdf/*
}

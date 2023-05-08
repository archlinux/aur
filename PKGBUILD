# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: bslackr <brendan at vastactive dot com>
# Contributor: Firmicus <firmicus āt gmx dōt net>

_pkgname=lateef
pkgname=ttf-sil-$_pkgname
_fname=${_pkgname^}
pkgver=4.000
pkgrel=1
pkgdesc='An Arabic script font for Sindhi and other languages of southern Asia'
arch=(any)
url="https://software.sil.org/$_pkgname"
license=(OFL)
conflicts=('ttf-sil-fonts<=6')
_archive="$_fname-$pkgver"
source=("https://software.sil.org/downloads/r/$_pkgname/$_archive.zip")
sha256sums=('547580801884acb1c6cc77fa2e27a638bf1282dce6e26d54bebccaa7587ca5c8')

package() {
	cd "$_archive"
	install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.txt FONTLOG.txt documentation/pdf/*
}

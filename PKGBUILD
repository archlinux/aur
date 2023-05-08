# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=harmattan
pkgname=ttf-sil-$_pkgname
_fname=${_pkgname^}
pkgver=4.000
pkgrel=1
pkgdesc='An Arabic script font designed for use by languages in West Africa'
arch=(any)
url="https://software.sil.org/$_pkgname"
license=(OFL)
conflicts=('ttf-sil-fonts<=6')
_archive="$_fname-$pkgver"
source=("https://software.sil.org/downloads/r/$_pkgname/$_archive.zip")
sha256sums=('f777b86bf874ce299895f78768d7a034e893b89bd1dfee7bd947075fd2656973')

package() {
    cd "$_archive"
	install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.txt FONTLOG.txt documentation/pdf/*
}

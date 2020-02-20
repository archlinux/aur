# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=mondulkiri
pkgname=ttf-sil-$_pkgname
_fname=${_pkgname^}
pkgver=7.100
_pkgver=5.300
pkgrel=4
pkgdesc='Khmer Mondulkiri, Busra, Oureang, and Ratanakiri fonts for the Khmer script'
arch=('any')
url="https://software.sil.org/$_pkgname"
license=('OFL')
conflicts=('ttf-sil-fonts<=6')
source=("http://software.sil.org/downloads/r/$_pkgname/$_fname-$pkgver.zip"
        "http://software.sil.org/downloads/r/$_pkgname/$_fname-$_pkgver.zip")
sha256sums=('c2e5dc08f4835be9a0da5cf9dcf92105aff973e47fc31e075e8bc44bec632c85'
            '6de8d3c40d0bff74fb83d76a0d4579e4c0d0ceb204d2adcebf99a355267835fe')

package() {
    cd "$_fname-$_pkgver"
    find -type f -iname "*.ttf" -execdir \
        install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" {} \;
    cd "../$_fname-$pkgver"
    find -type f -name "*.ttf" -execdir \
        install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" {} \;
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" FONTLOG.txt documentation/*.pdf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}

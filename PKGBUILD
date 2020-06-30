# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=harmattan
pkgname=ttf-sil-$_pkgname
_fname=${_pkgname^}
pkgver=2.000
pkgrel=1
pkgdesc='An Arabic script font designed for use by languages in West Africa'
arch=('any')
url="https://software.sil.org/$_pkgname"
license=('OFL')
conflicts=('ttf-sil-fonts<=6')
source=("http://software.sil.org/downloads/r/$_pkgname/$_fname-$pkgver.zip")
sha256sums=('0b2e1fad07b6101bfb140801a71bc53956105376fd8ac261dd76eab178280a5c')

package() {
    cd "$_fname-$pkgver"
    find -type f -name "$_fname*.ttf" -execdir \
        install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" {} \;
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.txt FONTLOG.txt documentation/*.pdf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}

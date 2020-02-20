# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=annapurna
pkgname=ttf-sil-$_pkgname
_fname=${_pkgname^}SIL
pkgver=1.204
pkgrel=4
pkgdesc='supports the many diverse languages that use the Devanagari script'
arch=('any')
url="https://software.sil.org/$_pkgname"
license=('custom:OFL')
conflicts=('ttf-sil-fonts<=6')
source=("http://software.sil.org/downloads/r/$_pkgname/$_fname-$pkgver.zip")
sha256sums=('d85cbd17f90a882255eb6f915729e164703c2b708b80ebd96db948556c13e9f0')

package() {
    cd "$_fname-$pkgver"
    find -type f -name "$_fname*.ttf" -execdir \
        install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" {} \;
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.txt FONTLOG.txt documentation/*.pdf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}

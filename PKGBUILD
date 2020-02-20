# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=namdhinggo
pkgname=ttf-sil-$_pkgname
_fname=${_pkgname^}SIL
pkgver=1.004
pkgrel=4
pkgdesc='Unicode font for the Limbu writing system of Nepal'
arch=('any')
url="https://software.sil.org/$_pkgname"
license=('OFL')
conflicts=('ttf-sil-fonts<=6')
source=("http://software.sil.org/downloads/r/$_pkgname/$_fname-$pkgver.zip")
sha256sums=('8bd69ee93687f2b3fcb705b0c8867c8ff573edcaf9a5c51a08a8ca1c1ddc966b')

package() {
    cd "$_fname"
    find -type f -name "$_fname*.ttf" -execdir \
        install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" {} \;
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.txt FONTLOG.txt
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}

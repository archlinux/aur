# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=alkalami
pkgname=ttf-sil-$_pkgname
_fname=${_pkgname^}
pkgver=1.200
pkgrel=4
pkgdesc='Unicode font for Arabic-based writing systems in the Kango region of Nigeria and Niger'
arch=('any')
url="https://software.sil.org/$_pkgname"
license=('custom:OFL')
conflicts=('ttf-sil-fonts<=6')
source=("http://software.sil.org/downloads/r/$_pkgname/$_fname-$pkgver.zip")
sha256sums=('f294789b09d1aaaa56f70b198ab842b88803ae649ce3e4e74df8e9f1ac4662d5')

package() {
    cd "$_fname-$pkgver"
    find -type f -name "$_fname*.ttf" -execdir \
        install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" {} \;
    find
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.txt FONTLOG.txt documentation/*.pdf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}

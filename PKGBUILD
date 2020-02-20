# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=tagmukay
pkgname=ttf-sil-$_pkgname
_fname=${_pkgname^}
pkgver=2.000
pkgrel=4
pkgdesc='A Shifinagh font that supports the Tawallammat dialect of Tamajaq'
arch=('any')
url="https://software.sil.org/$_pkgname"
license=('OFL')
conflicts=('ttf-sil-fonts<=6')
source=("http://software.sil.org/downloads/r/$_pkgname/$_fname-$pkgver.zip")
sha256sums=('f657adf6c91e75f81d53bb4f305df80656f2eee7013d349493883e4bcb6edbcd')

package() {
    cd "$_fname-$pkgver"
    find -type f -name "$_fname*.ttf" -execdir \
        install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" {} \;
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.txt FONTLOG.txt documentation/*.pdf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}

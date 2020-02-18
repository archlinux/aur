# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=padauk
pkgname=ttf-sil-$_pkgname
_fname=${_pkgname^}
pkgver=4.000
pkgrel=2
pkgdesc='Unicode font that supports the many diverse languages that use the Myanmar script'
arch=('any')
url="https://software.sil.org/$_pkgname"
license=('OFL')
source=("http://software.sil.org/downloads/r/$_pkgname/$_fname-$pkgver.zip")
sha256sums=('dd5311eaf0204b75044a856dbb2176a5db2bfe8ad00276ac5ff89f72d9d211fc')

package() {
    cd "$_fname-$pkgver"
    find -type f -iname "$_fname*.ttf" -execdir \
        install -Dm644 {} -t "$pkgdir/usr/share/fonts/TTF" \;
    install -Dm644 OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}

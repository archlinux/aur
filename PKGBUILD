# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=nuosu
pkgname=ttf-sil-$_pkgname
_fname=${_pkgname^}SIL
pkgver=2.1.1
pkgrel=2
pkgdesc='Unicode font for the standardized Yi script'
arch=('any')
url="https://software.sil.org/$_pkgname"
license=('OFL')
source=("http://software.sil.org/downloads/r/$_pkgname/$_fname-$pkgver.zip")
sha256sums=('b1acb6da9b9ccaa921fea1f8e206c743928f84fb083dbeb77485e1824cdcf9e7')

package() {
    cd "$_fname"
    find -type f -iname "$_fname*.ttf" -execdir \
        install -Dm644 {} -t "$pkgdir/usr/share/fonts/TTF" \;
    install -Dm644 OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}

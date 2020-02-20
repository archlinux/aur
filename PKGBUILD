# Maintainer: Anton Leontiev <scileont /at/ gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Baptiste Grenier <baptiste@bapt.name>

_pkgname=andika
pkgname=ttf-$_pkgname
_fname=${_pkgname^}
pkgver=5.000
pkgrel=4
pkgdesc='A sans serif, Unicode-compliant font designed especially for literacy use'
url="http://software.sil.org/$_pkgname"
arch=('any')
license=('OFL')
conflicts=('ttf-sil-fonts<=6')
source=("https://software.sil.org/downloads/r/$_pkgname/$_fname-$pkgver.zip")
sha256sums=('604b7a1194be099bdf311ef76cbce086a054fa16d2b101cfaedcf527c63df507')

package() {
    cd "$_fname-$pkgver"
    find -type f -name "$_fname*.ttf" -execdir \
        install -Dm644 {} -t "$pkgdir/usr/share/fonts/TTF" \;
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.txt FONTLOG.txt documentation/Andika-features.pdf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}

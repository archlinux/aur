# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=abyssinica
pkgname=ttf-sil-$_pkgname
_fname=${_pkgname^}SIL
pkgver=2.100
pkgrel=1
pkgdesc='Ethiopic script font following calligraphic traditions'
arch=('any')
url="https://software.sil.org/$_pkgname"
license=('OFL')
conflicts=('ttf-sil-fonts<=6')
source=("https://software.sil.org/downloads/r/$_pkgname/$_fname-$pkgver.zip")
sha256sums=('1a1fc8e82f0c0f2e824f42bff05c1f4a0356330a89dc7ba798c1a20bc3e333e0')

package() {
    cd "$_fname-$pkgver"
    find ./ -type f -name "$_fname*.ttf" -execdir \
        install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" {} \;
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.txt FONTLOG.txt documentation/*.pdf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}

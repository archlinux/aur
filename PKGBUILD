# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=abyssinica
pkgname=ttf-sil-$_pkgname
_fname=${_pkgname^}SIL
pkgver=2.000
pkgrel=5
pkgdesc='Ethiopic script font following calligraphic traditions'
arch=('any')
url="https://software.sil.org/$_pkgname"
license=('OFL')
conflicts=('ttf-sil-fonts<=6')
source=("https://software.sil.org/downloads/r/$_pkgname/$_fname-$pkgver.zip")
sha256sums=('274204a53b30f64cca662d78c7199e3c0325ea95ad4109886b47af734c92d0f9')

package() {
    cd "$_fname-$pkgver"
    find ./ -type f -name "$_fname*.ttf" -execdir \
        install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" {} \;
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.txt FONTLOG.txt documentation/*.pdf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}

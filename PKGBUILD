# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=abyssinica
pkgname=ttf-sil-$_pkgname
_fname=AbyssinicaSIL
pkgver=2.000
pkgrel=2
pkgdesc='Ethiopic script font following calligraphic traditions'
arch=('any')
url="https://software.sil.org/$_pkgname"
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
source=("http://software.sil.org/downloads/r/$_pkgname/$_fname-$pkgver.zip")
sha256sums=('274204a53b30f64cca662d78c7199e3c0325ea95ad4109886b47af734c92d0f9')

package() {
    cd "$_fname-$pkgver"
    find -type f -name "$_fname*.ttf" -execdir \
        install -Dm644 {} -t "$pkgdir/usr/share/fonts/TTF" \;
    install -Dm644 OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}

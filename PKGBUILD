# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ttf-sil-abyssinica
_fname=AbyssinicaSIL
pkgver=2.000
pkgrel=1
pkgdesc='OpenType calligraphic font for Ethiopic languages from SIL'
arch=('any')
url='https://software.sil.org/abyssinica/'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
source=("http://software.sil.org/downloads/r/abyssinica/$_fname-$pkgver.zip")
sha256sums=('274204a53b30f64cca662d78c7199e3c0325ea95ad4109886b47af734c92d0f9')

package() {
    cd "$_fname-$pkgver"
    find -type f -name "$_fname*.ttf" -execdir \
        install -Dm644 {} "$pkgdir"/usr/share/fonts/TTF/{} \;
    install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname"/LICENSE
}

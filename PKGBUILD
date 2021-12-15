# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=awami-nastaliq
pkgname=ttf-sil-$_pkgname
_fname=AwamiNastaliq
pkgver=2.200
pkgrel=1
pkgdesc='Designed for Arabic-based writing systems using the Nastaliq-style'
arch=('any')
url="https://software.sil.org/${_pkgname/-*}"
license=('OFL')
conflicts=('ttf-sil-fonts<=6')
source=("http://software.sil.org/downloads/r/${_pkgname/-*}/$_fname-$pkgver.zip")
sha256sums=('455202e10883c7ef3d9ee14a96ec75646ee69d5e9dc0a2f70fa7be5f332cd9af')

package() {
    cd "$_fname-$pkgver"
    find -type f -iname "$_fname*.ttf" -execdir \
        install -Dm644 {} -t "$pkgdir/usr/share/fonts/TTF" \;
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.txt FONTLOG.txt documentation/*.pdf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}

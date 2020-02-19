# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=awami-nastaliq
pkgname=ttf-sil-$_pkgname
_fname=AwamiNastaliq
pkgver=2.000
pkgrel=3
pkgdesc='Designed for Arabic-based writing systems using the Nastaliq-style'
arch=('any')
url="https://software.sil.org/${_pkgname/-*}"
license=('custom:OFL')
source=("http://software.sil.org/downloads/r/${_pkgname/-*}/$_fname-$pkgver.zip")
sha256sums=('caa282f45361b6f661a9aeccb039f6264b0be2dfd631f5e83c6b8ee940b5794a')

package() {
    cd "$_fname-$pkgver"
    find -type f -iname "$_fname*.ttf" -execdir \
        install -Dm644 {} -t "$pkgdir/usr/share/fonts/TTF" \;
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.txt FONTLOG.txt documentation/*.pdf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}

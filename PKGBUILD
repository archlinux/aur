# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=dai-banna
pkgname=ttf-sil-$_pkgname
_fname=DaiBannaSIL
pkgver=4.000
pkgrel=1
pkgdesc='Unicode font for rendering New Tai Lue (Xishuangbanna Dai) characters'
arch=(any)
url="https://software.sil.org/${_pkgname/-}"
license=(OFL)
conflicts=('ttf-sil-fonts<=6')
_archive="$_fname-$pkgver"
source=("https://software.sil.org/downloads/r/${_pkgname/-}/$_archive.zip")
sha256sums=('6da8fcb7b97c8c8a734aeb51642913c5dd083dc1c59c924212ee166637dbb88a')

package() {
    cd "$_archive"
    find -type f -name "$_fname-*.ttf" -execdir \
        install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" {} \;
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.txt FONTLOG.txt documentation/pdf/*.pdf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}

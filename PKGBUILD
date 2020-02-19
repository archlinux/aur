# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=apparatus
pkgname=ttf-sil-$_pkgname
_fname=${_pkgname^}SIL
_pname=AppSIL
pkgver=1.0
pkgrel=2
pkgdesc='Symbols used for Biblical text apparatus'
arch=('any')
url="https://scripts.sil.org/$_fname"
license=('custom:OFL')
source=("$_fname-$pkgver.zip::https://scripts.sil.org/cms/scripts/render_download.php?format=file&media_id=$_pname$pkgver.zip&filename=$_fname.zip")
sha256sums=('0d8e3143b9c46c97916ab2cf85ae2187fe33b9b40859567a5524266dd58581bc')

package() {
    cd "Apparatus SIL"
    find -type f -name "$_pname*.ttf" -execdir \
        install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" {} \;
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" FONTLOG.txt
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}

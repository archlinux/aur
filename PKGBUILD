# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=dai-banna
pkgname=ttf-sil-$_pkgname
_fname=DaiBanna
pkgver=2.200
pkgrel=4
pkgdesc='Unicode font for rendering New Tai Lue (Xishuangbanna Dai) characters'
arch=('any')
url="https://software.sil.org/${_pkgname/-}"
license=('OFL')
conflicts=('ttf-sil-fonts<=6')
source=("http://software.sil.org/downloads/r/$_pkgname/$_fname-$pkgver.zip")
sha256sums=('bab67e560484ee9bc041d1e95ae2e36a08ceb9cde6800ef032381fae0700f691')

package() {
    cd "$_pkgname-$pkgver"
    find -type f -name "DBSIL*.ttf" -execdir \
        install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" {} \;
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.txt FONTLOG.txt doc/*.pdf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}

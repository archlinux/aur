# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=tai-heritage
pkgname=ttf-sil-$_pkgname-pro
_fname=TaiHeritagePro
pkgver=2.600
pkgrel=5
pkgdesc='A typeface that reflects the traditional style of the Tai Viet script'
arch=('any')
url="https://software.sil.org/${_pkgname/-}"
license=('OFL')
conflicts=('ttf-sil-fonts<=6')
source=("https://software.sil.org/downloads/r/${_pkgname/-}/$_fname-$pkgver.zip")
sha256sums=('1b9c38008d7704ce6dc0e3be6b9e767f5c114252d4f417d474f2a22989af746d')

package() {
    cd "$_fname-$pkgver"
    find -type f -name "$_fname*.ttf" -execdir \
        install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" {} \;
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.txt FONTLOG.txt documentation/"$_fname"*.pdf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}

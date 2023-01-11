# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: bslackr <brendan at vastactive dot com>
# Contributor: Firmicus <firmicus āt gmx dōt net>

_pkgname=lateef
pkgname=ttf-sil-$_pkgname
_fname=${_pkgname^}
pkgver=2.000
pkgrel=1
pkgdesc='An Arabic script font for Sindhi and other languages of southern Asia'
arch=('any')
url="https://software.sil.org/$_pkgname"
license=('OFL')
conflicts=('ttf-sil-fonts<=6')
_archive="$_fname-$pkgver"
source=("http://software.sil.org/downloads/r/$_pkgname/$_archive.zip")
sha256sums=('3a4baec89e25f04e19b4edecfe59624ab33cfc275276009d3caca299ee013d99')

package() {
    cd "$_archive"
    find -type f -name "$_fname-*.ttf" -execdir \
        install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" {} \;
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.txt FONTLOG.txt documentation/pdf/*.pdf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}

# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: OmeGa <omega [U+0040] mailoo [.] org>
# Contributor: Firmicus <firmicus āt gmx dōt net>

_pkgname=ezra
pkgname=ttf-sil-$_pkgname
_fname=${_pkgname^}SIL
pkgver=2.51
pkgrel=6
pkgdesc='OpenType Hebrew font from SIL'
arch=('any')
url="https://software.sil.org/$_pkgname"
license=('OFL' 'MIT')
conflicts=('ttf-sil-fonts<=6')
source=("http://software.sil.org/downloads/r/$_pkgname/$_fname-$pkgver.zip")
sha256sums=('f16bcb3ec4473ac6a9f138ee0dbde7cc2f835e93a90cbe8649b3f32677760cc1')

package() {
    cd "$_fname$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.txt FONTLOG.txt
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" Licenses.txt OFL-FAQ.txt
}

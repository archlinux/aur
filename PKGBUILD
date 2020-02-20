# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=galatia
pkgname=ttf-sil-$_pkgname
_fname=${_pkgname^}SIL
pkgver=2.1
pkgrel=4
pkgdesc='Unicode font to support Biblical Polytonic Greek'
arch=('any')
url="https://software.sil.org/$_pkgname"
license=('OFL')
conflicts=('ttf-sil-fonts<=6')
source=("http://software.sil.org/downloads/r/$_pkgname/$_fname-$pkgver.zip")
sha256sums=('0d0a34646a18267c5147ee01448268098ebb00c4563eb6e9260037f2d171aa92')

package() {
    cd "${_fname/atia}${pkgver/.}"
    find -type f -iname "${_fname/atia}*.ttf" -execdir \
        install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" {} \;
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" FONTLOG.txt
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}

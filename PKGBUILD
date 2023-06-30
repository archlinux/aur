# Maintainer: Caleb Maclennan <caleb@alerque.com>

_project=MyNerve
pkgbase=${_project,,}-font
pkgname=("ttf-${_project,,}" "otf-${_project,,}")
pkgver=1.000
_sha=4220ec76c588d97b43757c5332b0aa45ed9a52f3
pkgrel=1
pkgdesc='A handwritten font for notes and comments'
arch=(any)
url="https://github.com/carolinashort/$_project"
license=(OFL)
_archive="$_project-$_sha"
source=("$url/archive/$_sha/$_archive.tar.gz")
sha256sums=('70fb7eecfa10cf6a3275997284131a91afa490dd761676210f3ee5266b948b9f')

package_otf-mynerve () {
    pkgdesc+=" (OpenType)"
    provides=("$pkgbase")
    cd "$_archive"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" fonts/otf/*.otf
    install -Dm644 OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_ttf-mynerve () {
    pkgdesc+=" (TrueType)"
    provides=("$pkgbase")
    cd "$_archive"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" fonts/ttf/*.ttf
    install -Dm644 OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}

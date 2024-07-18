# Maintainer: Tblue <tilman (at) ax86 (dot) net>
# Contributor: ajs124 < aur AT ajs124 DOT de >
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: dale <dale@archlinux.org>
# Contributor: bender02 at gmx dot com

pkgname=fortune-mod-hitchhiker
pkgver=20050611
pkgrel=4
pkgdesc="Collection of quotes (fortune cookies) from Douglas Adams' famous Hitchhikers Guide to the Galaxy"
url="https://www.splitbrain.org/projects/fortunes/hg2g"
arch=('any')
license=('unknown')
depends=('fortune-mod')
source=(https://www.splitbrain.org/_media/projects/fortunes/fortune-hitchhiker.tgz)

pkgver() {
    date -ur "${srcdir?}/fortune-hitchhiker/hitchhiker" '+%Y%m%d'
}

build() {
    cd "${srcdir?}/fortune-hitchhiker"

    mv hitchhiker orig.hitchhiker
    iconv -f latin1 -t utf8 orig.hitchhiker > hitchhiker
    strfile hitchhiker
}

package() {
    install -Dm 644 -t "${pkgdir?}/usr/share/fortune" \
        "${srcdir?}/fortune-hitchhiker/hitchhiker"*
}

sha256sums=('1cf64726d274e2d0e48d7dc92716c7401908f476e17f03a3420126025bafcf99')

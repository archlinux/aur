# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-themes
pkgver=2.1.7
pkgrel=1
pkgdesc='A collection of Mint themes.'
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=('GPL-3.0-or-later')
depends=(
    'ttf-ubuntu-font-family'
)
makedepends=(
    'python'
    'sassc'
)
optdepends=(
    'mint-y-icons'
    'mint-x-icons'
)
options=('!strip')
source=("${pkgname}_${pkgver}.tar.xz::${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('42a77084026dd6ffb8f271be5da01f478df59f458891018f56e3e4fee7a40422')

build() {
    cd "$pkgname"
    make clean
    make
}

package() {
    cd "$pkgname"
    cp -r usr "$pkgdir/"
}

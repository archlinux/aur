# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-themes
pkgver=2.3.1
pkgrel=1
pkgdesc='A collection of Mint themes.'
arch=('any')
url="https://github.com/linuxmint/mint-themes"
_url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=('GPL-3.0-or-later')
depends=(
    'ttf-ubuntu-font-family'
)
makedepends=(
    'python-libsass'
)
optdepends=(
    'mint-x-icons'
    'mint-y-icons'
)
options=('!strip')
source=("${pkgname}_${pkgver}.tar.xz::${_url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('cf66091f33d4b13802998a4f11370a8f9f2cd3a7d408095752ca1477918df084')

build() {
    cd "$pkgname"
    make clean
    make
}

package() {
    cd "$pkgname"
    cp -r usr "$pkgdir/"
}

# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-themes
pkgver=2.4.0
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
sha256sums=('2f3bc5f8b51d5f5da8ebb6c937cc2855185eef97f32d595a6c95c242f84056cc')

build() {
    cd "$pkgname"
    make clean
    make
}

package() {
    cd "$pkgname"
    cp -r usr "$pkgdir/"
}

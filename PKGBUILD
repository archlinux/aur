# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-themes
pkgver=2.3.8
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
sha256sums=('5322226a3505829c2adf2489358563657cc4678ec4725fb9eca14ea3e29238b4')

build() {
    cd "$pkgname"
    make clean
    make
}

package() {
    cd "$pkgname"
    cp -r usr "$pkgdir/"
}

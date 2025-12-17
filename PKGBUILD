# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-themes
pkgver=2.3.5
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
sha256sums=('a9eeee1a81411342f685f1f6cad3694d5dc36ed4c818246dba0133253168848d')

build() {
    cd "$pkgname"
    make clean
    make
}

package() {
    cd "$pkgname"
    cp -r usr "$pkgdir/"
}

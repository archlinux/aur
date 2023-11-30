# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-themes
pkgver=2.1.6
pkgrel=1
pkgdesc='A collection of Mint themes.'
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=('GPL3')
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
sha256sums=('5358493edeca9188a8c243ba6f352d020b8961d852836319b0292117ed17e096')

build() {
  cd "$pkgname"
  make clean
  make
}

package() {
  cd "$pkgname"
  cp -r usr "$pkgdir/"
}

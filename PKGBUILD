# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-themes-legacy
pkgver=1.8.9
pkgrel=1
pkgdesc='A collection of legacy mint themes.'
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=(GPL3)
depends=(
    ttf-ubuntu-font-family
)
makedepends=(
    gtk3
    inkscape
    optipng
    python
    sassc
)
optdepends=(
    mint-y-icons
    mint-x-icons
)
conflicts=(
    mint-x-theme
    mint-y-theme
    mint-cinnamon-themes
    mint-themes
)
source=("${pkgname}_${pkgver}.tar.xz::${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('b92352e35ee482c0502f556f875939ea47e9b55d898411d9907ed8e5638a649a')

build() {
	cd "${pkgname}"
	make
}

package() {
  cd "${srcdir}"/"${pkgname}"
  cp -r usr $pkgdir
}

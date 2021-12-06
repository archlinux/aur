# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-themes
pkgver=1.9.2
pkgrel=1
pkgdesc='A collection of Mint themes. Includes GTK2, GTK3, Cinnamon and Xfce components.'
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
)
source=("${pkgname}_${pkgver}.tar.xz::${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('661aed551bd6a42943f2440f1582974480bf44862217ce77a96d5f0af61451cc')

build() {
	cd "${pkgname}"
	make
}

package() {
  cd "${srcdir}"/"${pkgname}"
  cp -r usr $pkgdir
}

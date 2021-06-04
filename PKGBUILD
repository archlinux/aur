# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-themes
pkgver=1.8.8
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
sha256sums=('63f89b3943e666e0340dd444bb7ed4179d42f6a18b7096fb733ca67b7a68d113')

build() {
	cd "${pkgname}"
	make
}

package() {
  cd "${srcdir}"/"${pkgname}"
  cp -r usr $pkgdir
}

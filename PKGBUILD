# Maintainer: Sam Burgos < santiago dot burgos1089 at gmail dot com >

pkgname=mint-themes
pkgver=1.8.1
pkgrel=1
pkgdesc='A collection of Mint themes. Includes GTK2, GTK3, Cinnamon and Xfce components.'
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=(GPL3)
depends=(
    mint-y-icons
    mint-x-icons
    ttf-ubuntu-font-family
)
makedepends=(
    gtk3 
    ruby-sass
    optipng
    inkscape
    python
)
conflicts=(
    mint-x-theme
    mint-y-theme
    mint-cinnamon-themes
)
source=("${pkgname}_${pkgver}.tar.xz::${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('4e655a4c17db609263fe8fd81e80aeac945ee69475d965e6490182bb286f7427')

build() {
	cd "${pkgname}"
	make
}

package() {
  cd "${srcdir}"/"${pkgname}"
  cp -r usr $pkgdir
}

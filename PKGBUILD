# Maintainer: Sam Burgos < santiago dot burgos1089 at gmail dot com >

pkgname=mint-themes
pkgver=1.8.0
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
sha256sums=('7922f878d40ed88d48d662f4f725ab4182bec52a9881b7696bd79f7a28201b66')

build() {
	cd "${pkgname}"
	make
}

package() {
  cd "${srcdir}"/"${pkgname}"
  cp -r usr $pkgdir
}

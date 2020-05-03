# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=mint-themes
pkgver=1.8.4
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
    libsass
    optipng
    python
    ruby-sass
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
sha256sums=('5249b14f965b0df2300eae27dbf9d94d46117b8b02a338b41d8bc971624c55cf')

build() {
	cd "${pkgname}"
	make
}

package() {
  cd "${srcdir}"/"${pkgname}"
  cp -r usr $pkgdir
}

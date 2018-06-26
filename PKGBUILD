# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname=mint-themes
pkgver=1.7.1
pkgrel=2
pkgdesc="A collection of Mint themes. Includes GTK2, GTK3, Cinnamon and Xfce components."
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=('GPL3')
depends=('mint-y-icons' 
    'mint-x-icons')
makedepends=('gtk3' 
    'ruby-sass')
conflicts=("mint-x-theme" 
    "mint-y-theme"
    "mint-cinnamon-themes")
source=("${pkgname}_${pkgver}.tar.xz::${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('98867808b1caa458fc958c6768b38d1aafe10049c4ee34a606692704bd363932')

build() {
	cd "${pkgname}"
	make
}

package() {
  cd "${srcdir}"/"${pkgname}"
  cp -r usr $pkgdir
}

# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname=mint-themes
pkgver=1.7.6
pkgrel=1
pkgdesc="A collection of Mint themes. Includes GTK2, GTK3, Cinnamon and Xfce components."
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=('GPL3')
depends=('mint-y-icons' 
    'mint-x-icons')
makedepends=('gtk3' 
    'ruby-sass'
    'optipng'
    'inkscape')
conflicts=("mint-x-theme" 
    "mint-y-theme"
    "mint-cinnamon-themes")
source=("${pkgname}_${pkgver}.tar.xz::${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('5e603892d6377cd58c08c230c480b34e8d240d405e0df9aaf190fa18dc8081c2')

build() {
	cd "${pkgname}"
	make
}

package() {
  cd "${srcdir}"/"${pkgname}"
  cp -r usr $pkgdir
}

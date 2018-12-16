# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname=mint-themes
pkgver=1.7.7
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
sha256sums=('492edd452eccd9086783f6531908b41df47f563b3d7645550c624b4d62ce37a2')

build() {
	cd "${pkgname}"
	make
}

package() {
  cd "${srcdir}"/"${pkgname}"
  cp -r usr $pkgdir
}

# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname=mint-themes
pkgver=1.7.3
pkgrel=1
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
sha256sums=('a9838c005ff53370d8484adcaa0ae90b0c625779f2b3198bd9234409d3afcde5')

build() {
	cd "${pkgname}"
	make
}

package() {
  cd "${srcdir}"/"${pkgname}"
  cp -r usr $pkgdir
}

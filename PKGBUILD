# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname=mint-themes
pkgver=1.6.3
pkgrel=1
pkgdesc="A collection of Mint themes. Includes GTK2, GTK3, Cinnamon and Xfce components."
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=('GPL3')
depends=(mint-y-icons mint-x-icons)
makedepends=('gtk3' 'sassc')
conflicts=('mint-x-theme' 'mint-y-theme' 'mint-cinnamon-themes')
source=("${pkgname}_${pkgver}.tar.xz::${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('1c45624d055df1d41be3c6136e4c383a1f8daf8069291d6663ee83936a2f1243')

build() {
	cd $pkgname
	make
}

package() {
  cd $srcdir/$pkgname
  cp -r usr $pkgdir
}

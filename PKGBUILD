# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname=mint-themes
pkgver=1.6.8
pkgrel=1
pkgdesc="A collection of Mint themes. Includes GTK2, GTK3, Cinnamon and Xfce components."
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=('GPL3')
depends=(mint-y-icons mint-x-icons)
makedepends=('gtk3' 'sassc')
conflicts=('mint-x-theme' 'mint-y-theme' 'mint-cinnamon-themes')
source=("${pkgname}_${pkgver}.tar.xz::${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('eb66fadf5d052bcc1b3f1395f1969561b584ad6fa9a74e0d3cf2d41bbf750e20')

build() {
	cd $pkgname
	make
}

package() {
  cd $srcdir/$pkgname
  cp -r usr $pkgdir
}

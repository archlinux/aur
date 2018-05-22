# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname=mint-themes
pkgver=1.6.6
pkgrel=1
pkgdesc="A collection of Mint themes. Includes GTK2, GTK3, Cinnamon and Xfce components."
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=('GPL3')
depends=(mint-y-icons mint-x-icons)
makedepends=('gtk3' 'sassc')
conflicts=('mint-x-theme' 'mint-y-theme' 'mint-cinnamon-themes')
source=("${pkgname}_${pkgver}.tar.xz::${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('f5f1e1ff49ad6a46f460a8a1307b291d391f6c4d44b07fe8d8aeb2db53d464b1')

build() {
	cd $pkgname
	make
}

package() {
  cd $srcdir/$pkgname
  cp -r usr $pkgdir
}

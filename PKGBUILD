# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname=mint-themes
pkgver=1.6.4
pkgrel=1
pkgdesc="A collection of Mint themes. Includes GTK2, GTK3, Cinnamon and Xfce components."
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=('GPL3')
depends=(mint-y-icons mint-x-icons)
makedepends=('gtk3' 'sassc')
conflicts=('mint-x-theme' 'mint-y-theme' 'mint-cinnamon-themes')
source=("${pkgname}_${pkgver}.tar.xz::${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('6a04f7851f247d53cd1426292313dd6e57f9f8ebe1453126c8fbf15dc0945ee4')

build() {
	cd $pkgname
	make
}

package() {
  cd $srcdir/$pkgname
  cp -r usr $pkgdir
}

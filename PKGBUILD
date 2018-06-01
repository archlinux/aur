# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname=mint-themes
pkgver=1.6.7
pkgrel=1
pkgdesc="A collection of Mint themes. Includes GTK2, GTK3, Cinnamon and Xfce components."
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=('GPL3')
depends=(mint-y-icons mint-x-icons)
makedepends=('gtk3' 'sassc')
conflicts=('mint-x-theme' 'mint-y-theme' 'mint-cinnamon-themes')
source=("${pkgname}_${pkgver}.tar.xz::${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('bb392ddd4cd1fb1f40e1a7f6916e2f30160dc3913f6ad08ceb52d4d245c39eb6')

build() {
	cd $pkgname
	make
}

package() {
  cd $srcdir/$pkgname
  cp -r usr $pkgdir
}

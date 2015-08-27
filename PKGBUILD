#Maintainer: André Silva <emulatorman@parabola.nu>
#Maintainer: Márcio Silva <coadde@parabola.nu>

_pkgname=jquery
pkgname=jquery-ui
pkgver=1.11.3
pkgrel=1
pkgdesc='jQuery UI provides abstractions for low-level interaction and animation, advanced effects and high-level, themeable widgets, built on top of the jQuery JavaScript Library, that you can use to build highly interactive web applications'
arch=any
url=http://jqueryui.com/
license=MIT
depends=jquery
makedepends=(npm nodejs-grunt-cli)

source=https://github.com/$_pkgname/$pkgname/archive/$pkgver.tar.gz
sha512sums=fd828d85a0f47aae7230cffd5c606e1454edb506acc07fca4594e022b76bbd1265fbd6c2714f7d69175a533c225951e67ff26388dcf6f84ff982d9260a8c0c7c

build() {
  cd $srcdir/$pkgname-$pkgver
  npm install
  grunt concat:ui uglify:main
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -d $pkgdir/usr/share/javascript/$pkgname
  install -d $pkgdir/usr/share/licenses/$pkgname
  cp -a dist/* $pkgdir/usr/share/javascript/$pkgname
  cp -a LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# Maintainer: Bernhard Landauer <oberon@manjaro.org>

pkgname=xfce4-calculator-plugin
_maj=0.6
pkgver=$_maj.0
pkgrel=1
pkgdesc="Calculator plugin for the Xfce4 panel."
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/panel-plugins/$pkgname"
license=('GPL')
depends=('intltool' 'xfce4-panel')
install=$pkgname.install
source=(http://archive.xfce.org/src/panel-plugins/xfce4-calculator-plugin/$_maj/$pkgname-$pkgver.tar.bz2)
sha256sums=('eb51765580ea4650f9cf062382a820fb6483ee5dbe003aeb6f063929e299f9c2')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib --disable-static
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

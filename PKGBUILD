# Maintainer: Bernhard Landauer <oberon@manjaro.org>

pkgname=xfce4-calculator-plugin
_maj=0.7
pkgver=$_maj.0
pkgrel=1
pkgdesc="Calculator plugin for the Xfce4 panel."
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/panel-plugins/$pkgname"
license=('GPL')
depends=('intltool' 'xfce4-panel')
install=$pkgname.install
source=(http://archive.xfce.org/src/panel-plugins/$pkgname/$_maj/$pkgname-$pkgver.tar.bz2)
sha256sums=('7b50ab947ab058e1c079113e7f0f8b38ef242fec36ec9f31bb4e3c19cb3f9de9')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib --disable-static
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

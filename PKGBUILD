# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Henrik Tunedal <putte_xvi at tunedal dot nu>
pkgname=wmbattery
pkgver=2.51
pkgrel=1
pkgdesc="Battery monitor dockapp for Window Maker"
arch=('i686' 'x86_64')
url="http://windowmaker.org/dockapps/?name=wmbattery"
license=('GPL')
depends=('libxpm' 'upower')
#source=("$pkgname-$pkgver.tar.gz::http://windowmaker.org/dockapps/?download=wmbattery-2.48.tar.gz")
source=("http://www.dockapps.net/download/$pkgname-$pkgver.tar.gz")
md5sums=('159d75365530990f7d94b7a1cc74e086')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

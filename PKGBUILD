# Maintainer: willemw <willemw12@gmail.com>
# Contributor: halhen <halhen at k2h dot se>

pkgname=statnot
pkgver=0.0.4.post1
pkgrel=1
pkgdesc="Notification daemon for lightweight window managers"
arch=('x86_64')
#url="http://www.k2h.se/code/"
url="https://github.com/halhen/statnot"
license=('GPL')
depends=('gtk3' 'python-dbus' 'python-gobject') 
optdepends=('libnotify: send notifications to statnot'
            'xorg-xsetroot: default configuration calls xsetroot')
#source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
source=($pkgname-$pkgver::git+$url.git#commit=d70982eb5d86e7849295b634721a74a433fcb532)
md5sums=('SKIP')

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}


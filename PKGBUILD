# Maintainer: willemw <willemw12@gmail.com>
# Contributor: halhen <halhen at k2h dot se>

pkgname=statnot
pkgver=0.0.4
pkgrel=3
pkgdesc="Notification daemon for lightweight window managers"
arch=('i686' 'x86_64')
url="http://github.com/halhen/statnot"
license=('GPL')
depends=('pygtk' 'python2-dbus' 'python2-notify')
optdepends=(
        'libnotify: send notifications to statnot'
        'xorg-xsetroot: default configuration calls xsetroot')
source=(https://github.com/halhen/$pkgname/archive/$pkgver.tar.gz)
md5sums=('73b74044b7aec19ab2483d5bac04eb8e')

package() {
  cd $pkgname-$pkgver
  sed -i '1 s/python$/python2/' statnot
  make DESTDIR="$pkgdir" install
}


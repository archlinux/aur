# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Eric Belanger <belanger@astro.umontreal.ca>
# Contributor: Martin Lefebvre <dadexter@gmail.com>
# Contributor: Lee Jackson <tomoe AT lbjackson DOTCOM>

pkgname=kplayer
pkgver=0.7.2
pkgrel=1
pkgdesc="Multimedia player for KDE4 using mplayer as a backend"
arch=('i686' 'x86_64')
url="http://kplayer.sourceforge.net"
license=('GPL')
depends=('kdebase-runtime' 'mplayer')
makedepends=('cmake' 'automoc4')
source=("http://download.kde.org/stable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz")
md5sums=('c1e22416f09a4f723dd976c68e76fe9d')

build() {
  cd $srcdir/$pkgname-$pkgver
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=release ..
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver/build
  make DESTDIR="$pkgdir" install
}


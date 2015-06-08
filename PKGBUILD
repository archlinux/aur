# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Alessandro Nakamuta <alessandro dot ufms at gmail dot com>

pkgname=desktopnova
pkgver=0.8.1
pkgrel=4
pkgdesc="Changes your desktop wallpaper automatically after a preset period of time"
arch=('i686' 'x86_64')
url="https://launchpad.net/desktopnova"
license=('GPL')
depends=('gconf' 'gtk2' 'gtk-update-icon-cache' 'libxml2' 'xfconf')
makedepends=('cmake' 'intltool')
install=$pkgname.install
source=(https://launchpad.net/desktopnova/0.8/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('f1ce5cc731ddcb999ac09ff8461228b9')

build(){
  cd $pkgname-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}


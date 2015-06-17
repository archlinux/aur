# Maintainer: Maxim A. Mikityanskiy <maxtram95@gmail.com>
pkgname=musicpaused-git
pkgver=8.c8a4f14
pkgrel=1
pkgdesc="Pause music when headphones are unplugged"
arch=('i686' 'x86_64')
url="https://github.com/gentoo-root/musicpaused"
license=('GPL3')
provides=('musicpaused')
depends=('dbus' 'jacklistener-git')
makedepends=('git')
source=('musicpaused::git://github.com/gentoo-root/musicpaused.git')


build() {
  cd musicpaused
  make
}

package() {
  cd musicpaused
  make DESTDIR="$pkgdir" install
}

pkgver() {
  cd musicpaused
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')

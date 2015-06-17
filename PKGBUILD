# Maintainer: M0Rf30

pkgname=jacknotifier-git
pkgver=11.0de9ea9
pkgrel=1
pkgdesc="Headphones Jack Notification Daemon"
arch=('i686' 'x86_64')
url="https://github.com/gentoo-root/jacknotifier"
license=('GPL3')
provides=('jacknotifier')
depends=('dbus' 'libnotify' 'jacklistener-git')
makedepends=('git')
source=('jacknotifier::git://github.com/gentoo-root/jacknotifier.git')


build() {
  cd jacknotifier
  make
}

package() {
  cd jacknotifier
  make DESTDIR="$pkgdir" install
}

pkgver() {
  cd jacknotifier
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')

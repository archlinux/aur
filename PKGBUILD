# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Andrés R. <andthesito at gmail dot com>

pkgname=wmudmount-gtk2
_pkgname=wmudmount
pkgver=1.13
pkgrel=4
pkgdesc='A filesystem mounter dockapp that uses udisks.'
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/$_pkgname/"
license=('GPL')
groups=('x11')
depends=('dbus-glib' 'gtk2' 'libgnome-keyring' 'libnotify')
makedepends=('imagemagick')
source=("https://downloads.sourceforge.net/project/$_pkgname/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('988955faca6db4f9c4d26f8b79a38744')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr
  make
}
package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}


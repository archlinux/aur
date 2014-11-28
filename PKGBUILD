# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Jan Misiak <fijam [at] archlinux.us>

pkgname=gigolo
pkgver=0.4.2
pkgrel=1
pkgdesc="Frontend to manage connections to remote filesystems using GIO/GVFS"
arch=('i686' 'x86_64')
url="http://www.uvena.de/gigolo"
license=('GPL2')
depends=('gtk2' 'gvfs')
makedepends=('intltool')
#makedepends=('gettext' 'intltool' 'python2')
optdepends=('gnome-mount: to use HAL mounter for local drives')
conflicts=('gigolo-git')
source=(http://files.uvena.de/$pkgname/$pkgname-$pkgver.tar.bz2)
sha256sums=('553fc78fe4e7bd2f01f3851baea7e63f6414fe652dfb4b08c60b5c4b2b909164')

build() {
  cd ${srcdir}/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}

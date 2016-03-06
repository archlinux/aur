# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=libsmack
pkgver=1.1.0
pkgrel=1
pkgdesc="Userspace library and helper tools for the Smack LSM"
arch=('i686' 'x86_64')
url="https://github.com/smack-team/smack"
license=('LGPL')
source=(https://github.com/smack-team/smack/archive/v${pkgver}.tar.gz)
sha256sums=('94dc21b4a5e570af0eb44debf57491170cccdbf60e03b5a3210f2a14d6448390')

build() {
  cd "$srcdir/smack-$pkgver"
  ./autogen.sh
  make
}

package() {
  cd "$srcdir/smack-$pkgver"
  make DESTDIR="${pkgdir}"/ install
}

# vim:set ts=2 sw=2 et:

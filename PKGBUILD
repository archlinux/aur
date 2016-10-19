# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=libsmack
pkgver=1.3.0
pkgrel=1
pkgdesc="Userspace library and helper tools for the Smack LSM"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/smack-team/smack"
license=('LGPL')
source=(https://github.com/smack-team/smack/archive/v${pkgver}.tar.gz)
sha256sums=('5f2677086b5589cd169c072a509aa72ec124a95e506e5753df81632f82282a57')

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

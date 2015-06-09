# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=libsmack
pkgver=1.0.5
pkgrel=1
pkgdesc="Userspace library and helper tools for the Smack LSM"
arch=('i686' 'x86_64')
url="https://github.com/smack-team/smack"
license=('LGPL')
source=(https://github.com/smack-team/smack/archive/v${pkgver}.tar.gz)
sha256sums=('0e8c603588dd4445ddc2ef1077e40fb5270a23a3c74dc885240fa562a781a868')

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

# Maintainer: Danct12 <danct12@disroot.org>

pkgname=libgbinder
pkgver=1.1.39
pkgrel=1
pkgdesc="GLib-style interface to binder"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/mer-hybris/libgbinder.git"
license=('BSD')
depends=('libglibutil' 'glib2')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mer-hybris/libgbinder/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('ce6b1ec2c18a0d3da3f6a2e76acdf879163a8123207c1814362b8e5c0c8c592a1e9f9d378c44f3b29d6feaf4671dce3b37d06dd1c64b9ec9198a579e131146c5')

build() {
  cd $pkgname-$pkgver
  make KEEP_SYMBOLS=1 release pkgconfig
}

package() {
  cd $pkgname-$pkgver
  make install-dev DESTDIR="${pkgdir}"
}

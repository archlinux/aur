# Maintainer: Danct12 <danct12@disroot.org>

pkgname=libgbinder
pkgver=1.1.16
pkgrel=1
pkgdesc="GLib-style interface to binder"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/mer-hybris/libgbinder.git"
license=('BSD')
depends=('libglibutil' 'glib2')
makedepends=('git')
_commit="1bc2efd7249e1cf1b50d9ff1dcf57ffea528f0e9" # tags/1.1.16
source=(${pkgname}::git+https://github.com/mer-hybris/libgbinder.git#commit=${_commit})
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
  cd ${pkgname}
  make KEEP_SYMBOLS=1 release pkgconfig
}

package() {
  cd ${pkgname}
  make install-dev DESTDIR="${pkgdir}"
}

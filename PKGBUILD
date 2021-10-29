# Maintainer: Danct12 <danct12@disroot.org>

pkgname=libgbinder
pkgver=1.1.13
pkgrel=1
pkgdesc="GLib-style interface to binder"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/mer-hybris/libgbinder.git"
license=('BSD')
depends=('libglibutil' 'glib2')
makedepends=('git')
_commit="7f7202107558ecfaa2b4e0d45cac5d1ba5c45569" # tags/1.1.13
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

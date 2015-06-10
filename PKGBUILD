# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=umockdev
pkgver=0.8.10
pkgrel=1
pkgdesc="Record/mock hardware devices for bug reports and regression tests"
arch=(i686 x86_64)
url="https://github.com/martinpitt/umockdev/"
license=(LGPL)
makedepends=(gobject-introspection gtk-doc vala)
source=("https://github.com/martinpitt/umockdev/archive/${pkgver}.tar.gz")
sha512sums=('489393a78512eeae1c2061fd3d206a6efe34e3cafa0adafcbc3251ecd17e7acecb548c5f463e1e7f98738244ff126d5a5faab844bb033d179f65b56969be8bc0')

build() {
  cd "${pkgname}-${pkgver}"
  ./autogen.sh --prefix=/usr --enable-gtk-doc --enable-introspection
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}

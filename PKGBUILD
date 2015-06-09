# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=umockdev
pkgver=0.8.8
pkgrel=1
pkgdesc="Record/mock hardware devices for bug reports and regression tests"
arch=(i686 x86_64)
url="https://github.com/martinpitt/umockdev/"
license=(LGPL)
makedepends=(gobject-introspection gtk-doc vala)
source=("https://github.com/martinpitt/umockdev/archive/${pkgver}.tar.gz")
sha512sums=('fc07832ac4445af36d238544b98afb67c1f6f2d8c2cf36df2b760086baa32603c32e663db9270da1eb5921aa96c8f5b4f5e1bba2fc99d45f1c797418b9b6c09f')

build() {
  cd "${pkgname}-${pkgver}"
  ./autogen.sh --prefix=/usr --enable-gtk-doc --enable-introspection
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}

# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=umockdev
pkgver=0.8.11
pkgrel=1
pkgdesc="Record/mock hardware devices for bug reports and regression tests"
arch=(i686 x86_64)
url="https://github.com/martinpitt/umockdev/"
license=(LGPL)
depends=("systemd" "libgudev")
makedepends=(gobject-introspection gtk-doc vala)
source=("https://github.com/martinpitt/umockdev/archive/${pkgver}.tar.gz")
sha512sums=('3c66c9ae6cfb1b9b7dbf3b8e2fd1e6f3e5b1bc84e479cfe5ecba87dee4a725e9c855cae284d563d321ed9fcdf12a1f1012ea23ace6dc9e662494f7fd783ab7a6')

build() {
  cd "${pkgname}-${pkgver}"
  ./autogen.sh --prefix=/usr --enable-gtk-doc --enable-introspection
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}

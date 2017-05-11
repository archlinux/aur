# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=umockdev
pkgver=0.9.1
pkgrel=1
pkgdesc="Record/mock hardware devices for bug reports and regression tests"
arch=(i686 x86_64)
url="https://github.com/martinpitt/umockdev/"
license=(LGPL)
depends=("systemd" "libgudev")
makedepends=(gobject-introspection gtk-doc vala)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/martinpitt/umockdev/archive/${pkgver}.tar.gz")
sha256sums=('bb382c0095a9370270bf7f894b578637c21d91b6e4b02dd35595c3f3bf6545f4')

build() {
  cd "${pkgname}-${pkgver}"
  ./autogen.sh --prefix=/usr --enable-gtk-doc --enable-introspection
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}

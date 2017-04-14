# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=umockdev
pkgver=0.9
pkgrel=1
pkgdesc="Record/mock hardware devices for bug reports and regression tests"
arch=(i686 x86_64)
url="https://github.com/martinpitt/umockdev/"
license=(LGPL)
depends=("systemd" "libgudev")
makedepends=(gobject-introspection gtk-doc vala)
source=("https://github.com/martinpitt/umockdev/archive/${pkgver}.tar.gz")
sha512sums=('05079987cddf23aa452c01294366a811f524564e7a7e1a7f8da067bf99a315db9800d904bf34872c0fcec1c5f950fa44dacfaff9ebf203227919aa458fb9ed28')

build() {
  cd "${pkgname}-${pkgver}"
  ./autogen.sh --prefix=/usr --enable-gtk-doc --enable-introspection
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}

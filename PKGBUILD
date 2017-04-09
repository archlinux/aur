# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=umockdev
pkgver=0.8.13
pkgrel=1
pkgdesc="Record/mock hardware devices for bug reports and regression tests"
arch=(i686 x86_64)
url="https://github.com/martinpitt/umockdev/"
license=(LGPL)
depends=("systemd" "libgudev")
makedepends=(gobject-introspection gtk-doc vala)
source=("https://github.com/martinpitt/umockdev/archive/${pkgver}.tar.gz")
sha512sums=('5a39298c3750258040dd0f21aa2b8b692d3712635b33effec3386a45314a44153730b78619ddd20650abf5377b5f69a37791882f940cede45db30117442f21a4')

build() {
  cd "${pkgname}-${pkgver}"
  ./autogen.sh --prefix=/usr --enable-gtk-doc --enable-introspection
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}

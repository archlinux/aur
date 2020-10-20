# Maintainer: Kavya Gokul <hello @ properlypurple.com>

pkgname=braus-git
_pkgname=braus
pkgver=d58a27d
pkgrel=1
epoch=1
pkgdesc="Application to select a browser every time you click a link anywhere"
url="https://github.com/properlypurple/braus"
arch=(any)
license=(GPL3)
depends=(gsettings-desktop-schemas glib2 pango gtk3 python-gobject)
makedepends=(gobject-introspection git meson)
provides=(braus)
source=("git+https://github.com/properlypurple/braus")
sha256sums=('SKIP')


build() {
  cd ${srcdir}/braus
  meson build --prefix=/usr
}

package() {
  cd ${srcdir}/braus/build
  ninja
  DESTDIR="$pkgdir" ninja install
}

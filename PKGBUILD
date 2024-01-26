# Maintainer: Brody <archfan at brodix dot de>
# Contributor: Darvin Delgado <dnmodder@gmail.com>

pkgname=oversteer
pkgver=0.8.1
pkgrel=1
pkgdesc='Graphical application to configure Logitech Wheels'
arch=(any)
url=https://github.com/berarma/oversteer
license=(GPL3)
depends=(
  appstream-glib
  desktop-file-utils
  gettext
  python
  python-cairo
  python-evdev
  python-gobject
  python-matplotlib
  python-pyudev
  python-scipy
  python-pyxdg
)
makedepends=(meson)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/berarma/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=(26479ef8b06da2373d67bbf803fb3e7b12bea37506ad3b9d5a3376b08d225d25)

build() {
  cd ${pkgname}-${pkgver}
  meson build --prefix=/usr
  ninja -C build
}

package() {
  cd ${pkgname}-${pkgver}
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:

# Maintainer: Brody <archfan at brodix dot de>
# Contributor: Darvin Delgado <dnmodder@gmail.com>

pkgname=oversteer
pkgver=0.8.3
pkgrel=2
pkgdesc='Graphical application to configure Logitech Wheels'
arch=(any)
url=https://github.com/berarma/oversteer
license=(GPL-3.0-or-later)
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
  python-pyxdg
  python-scipy
)
makedepends=(meson)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/berarma/${pkgname}/archive/v${pkgver}.tar.gz)
b2sums=('30cc41e000a67d52a7f759019d97fb5a5f2d031de278ac026e623cbed2a020df9141cac1fe41ee1a30ab14c7c2846bdbb31d0165badac45c95c25750721a9ebb')

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

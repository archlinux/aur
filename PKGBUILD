# Maintainer: Brody <archfan at brodix dot de>
# Contributor: Darvin Delgado <dnmodder@gmail.com>

pkgname=oversteer
pkgver=0.8.2
pkgrel=2
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
  python-pyxdg
  python-scipy
)
makedepends=(meson)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/berarma/${pkgname}/archive/v${pkgver}.tar.gz)
b2sums=(e8762e8dc7bcf5ffcc577c11632a5bdfac74be013eb7e8694dc2571a6654f73b9550ebed61762ef3823e3a23f9dfd45a93fe498747848963a4c2a3522604ea45)

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

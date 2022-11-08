# Maintainer: Brody <archfan at brodix dot de>
# Contributor: Darvin Delgado <dnmodder@gmail.com>

pkgname=oversteer
pkgver=0.7.2
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
  python-xdg
)
makedepends=(meson)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/berarma/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=(7d8e497224bdb465bd60355d4c58b8a6c93a7e8ed53e6d5e54f159281e7f7a78)

build() {
	cd "${pkgname}-${pkgver}"
	meson build --prefix=/usr
	ninja -C build
}

package() {
	cd "${pkgname}-${pkgver}"
	DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:

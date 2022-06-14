# Maintainer: Brody <archfan at brodix dot de>
# Contributor: Darvin Delgado <dnmodder@gmail.com>

pkgname=oversteer
pkgver=0.7.1
pkgrel=1
pkgdesc='Graphical application to configure Logitech Wheels'
arch=('any')
url='https://github.com/berarma/oversteer'
license=('GPL3')
depends=(
  'appstream-glib'
  'desktop-file-utils'
  'gettext'
  'python'
  'python-cairo'
  'python-evdev'
  'python-gobject'
  'python-matplotlib'
  'python-pyudev'
  'python-scipy'
  'python-xdg'
)
makedepends=('meson')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/berarma/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('68686e25ccdee3fd4eee74f598a2c6ea6d3caf46837ea4117ee5b0869f462fc1')

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

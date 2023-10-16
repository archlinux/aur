# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=helium-gtk-theme
pkgdesc='GTK4 and GNOME Shell themes used in tauOS'
pkgver=1.5.9
pkgrel=1
url=https://github.com/tau-OS/tau-helium
arch=(any)
license=(GPL2)
makedepends=(meson dart-sass)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('b4e355f0ceb40f8dd631b9fea3f570bc913d8523df1d2fb86f07ff5355aac8970af376bf1bf1a7e6d6e4a0c09cae455d9a1a738d16b7097922a0a2971bd2bd91')

build () {
	rm -rf _build
	arch-meson _build "tau-helium-${pkgver}"
	meson compile -C _build
}

package () {
	meson install -C _build --destdir="${pkgdir}"
}

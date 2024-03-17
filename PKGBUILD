# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=helium-gtk-theme
pkgdesc='GTK4 and GNOME Shell themes used in tauOS'
pkgver=1.8.10r6
pkgrel=1
url=https://github.com/tau-OS/tau-helium
arch=(any)
license=(GPL2)
makedepends=(meson dart-sass)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver/r/-}.tar.gz")
b2sums=('0a31d13979d2a13fcc1d8247db3beb6dbff1400635d586fab12ac6d02c1c4aabcdd4ce027aa34e168a6810851b74140e9740ab0a779708f141456e691fc00d06')

build () {
	rm -rf _build
	arch-meson _build "tau-helium-${pkgver/r/-}"
	meson compile -C _build
}

package () {
	meson install -C _build --destdir="${pkgdir}"
}

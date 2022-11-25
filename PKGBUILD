# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=helium-gtk-theme
pkgdesc='GTK4 and GNOME Shell themes used in tauOS'
pkgver=1.1.22
pkgrel=1
url=https://github.com/tau-OS/tau-helium
arch=(any)
license=(GPL2)
makedepends=(meson dart-sass)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('267bcac896dd7293da21219552edba469e4f7c16404d408b9715435e00d15393651828bc5514497cc11d5bd6ff495b6f54ec1825a20e2040c940f12ede20fa92')

build () {
	rm -rf _build
	arch-meson _build "tau-helium-${pkgver}"
	meson compile -C _build
}

package () {
	meson install -C _build --destdir="${pkgdir}"
}

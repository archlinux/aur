# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=hydrogen-icon-theme
pkgdesc='Default icon theme for tauOS'
pkgver=1.0.1
pkgrel=0
url=https://github.com/tau-OS/tau-hydrogen
license=(GPL3)
arch=(any)
makedepends=(meson librsvg xorg-xcursorgen)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('a652e43131d4fa09f66c6aa64bf32b7236db36e7929221611f86e21d1bd1f09614e33cb80700e1a8a0a0fa3f8276f8d6ccc1dd62e8adb58a8fb525882070856f')

build () {
	rm -rf _build
	arch-meson _build "tau-hydrogen-${pkgver}"
	meson compile -C _build
}

package () {
	meson install -C _build --destdir="${pkgdir}"
}

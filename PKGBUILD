# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=helium-gtk-theme
pkgdesc='GTK4 and GNOME Shell themes used in tauOS'
pkgver=1.1.32
pkgrel=1
url=https://github.com/tau-OS/tau-helium
arch=(any)
license=(GPL2)
makedepends=(meson dart-sass)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('8e1c7bff1a29af89ef017d625d33025a2c476e4233d62c20ab64584224464ebcf60695e60cb4671c42d9db28697297a9bd70ce2e45df8292180db93f808701ad')

build () {
	rm -rf _build
	arch-meson _build "tau-helium-${pkgver}"
	meson compile -C _build
}

package () {
	meson install -C _build --destdir="${pkgdir}"
}

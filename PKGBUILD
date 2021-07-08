# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=health
_reponame=Health
pkgver=0.92.6
pkgrel=1
pkgdesc="A health tracking app for the GNOME desktop"
arch=(x86_64)
url=https://gitlab.gnome.org/Cogitri/Health
license=(GPL3)
depends=()
makedepends=(meson cargo)
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/${pkgver}/${_reponame}-${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
	arch-meson "${_reponame}-${pkgver}" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}

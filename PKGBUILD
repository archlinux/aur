# Maintainer: Oleksandr Natalenko aka post-factum <oleksandr@natalenko.name>

pkgname=pingtcp
pkgver=0.0.6
pkgrel=1
pkgdesc="Small utility to measure TCP handshake time (torify-friendly)"
url="https://gitlab.com/post-factum/${pkgname}"
arch=(x86_64)
license=(GPL3)
depends=(libbsd)
makedepends=(meson)
optdepends=("torsocks: for TOR support")
source=(${pkgname}-${pkgver}.tar.gz::https://gitlab.com/post-factum/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz)
sha256sums=('323c63039d390f300f705c78dedcf5adfa02364b93a184e506a58fd4ddba7be9')

build() {
	cd ${pkgname}-v${pkgver}

	arch-meson . build

	meson compile -C build
}

package() {
	cd ${pkgname}-v${pkgver}

	meson install -C build --destdir "${pkgdir}"
}


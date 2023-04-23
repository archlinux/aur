# PKGBUILD maintainer: Mikołaj Krzeszowiak
pkgname='sim-cli'
pkgver=0.1.0
pkgrel=1
pkgdesc="A command line front-end to the SIM platform."
arch=('x86_64')
url="https://gitlab.com/maleszka/sim-cli"
license=('GPL3')
depends=('curl')
makedepends=('meson>=0.60.0' 'ninja' 'cmake>=3.17.0' 'make' 'boost')
source=("https://gitlab.com/maleszka/sim-cli/-/releases/v${pkgver}/downloads/${pkgname}-src.tar.gz")
# WARNING: update this after each release!!
sha256sums=('cf3d48278d1925b2d5a0240ee39ec7aec6af929caed1351a7e760eb59357341b')

build() {
	cd "${srcdir}/${pkgname}"
	meson setup build --buildtype=release
	meson compile -C build
}

package() {
	cd "${srcdir}/${pkgname}"
	meson install -C build --destdir=${pkgdir}
}

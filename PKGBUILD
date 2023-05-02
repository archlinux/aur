# PKGBUILD maintainer: Mikołaj Krzeszowiak
pkgname='sim-cli'
pkgver=0.1.1
pkgrel=1
pkgdesc="A command line front-end to the SIM platform."
arch=('x86_64')
url="https://gitlab.com/maleszka/sim-cli"
license=('GPL3')
depends=('curl')
makedepends=('meson>=0.60.0' 'ninja' 'cmake>=3.17.0' 'boost')
source=("https://gitlab.com/maleszka/sim-cli/-/releases/v${pkgver}/downloads/${pkgname}-src.tar.gz")
# WARNING: update this after each release!!
sha256sums=('25b489e048243ed5339e39c7b068f18335837235707ca4e8b652c23f7866ddf4')

build() {
	cd "${srcdir}/${pkgname}"
	meson setup build --buildtype=release
	meson compile -C build
}

package() {
	cd "${srcdir}/${pkgname}"
	meson install -C build --destdir=${pkgdir}
}

pkgname=nudgis-obs-plugin
pkgver=1.0.0
pkgrel=5
pkgdesc="OBS plugin for UbiCast Nudgis"
arch=('x86_64')
url="https://github.com/UbiCastTeam/${pkgname}"
license=('GPL2')
depends=('obs-studio>=31' 'libcurl-gnutls')
makedepends=('git' 'cmake')
source=("git+https://github.com/UbiCastTeam/${pkgname}.git")
sha512sums=('SKIP')

build() {
    cd ${pkgname}
	cmake -B build -DCMAKE_BUILD_TYPE=Release
	cmake --build build
}

package() {
    cd ${pkgname}
    cmake --install build --prefix=${pkgdir}/usr
}

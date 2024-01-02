# Maintainer: balaraz <balaraz@tuta.io>

pkgname=sof
pkgver=5.0
pkgrel=1
pkgdesc="Simple and fast calculate size of directories"
license=(GPL3)
url="https://codeberg.org/balaraz/sof"
arch=(x86_64)
depends=()
makedepends=(cmake argumentum gzip)
provides=(sof)
conflicts=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=("81be9a34b486cd4bd33c777fe516dc2e495e40b85e6165a171be4998a0369266")

package() {
		cd ./sof
		cmake -Bbuild -DCMAKE_BUILD_TYPE=Release -DVERSION=${pkgver}
		cmake --build ./build
		DESTDIR="$pkgdir" cmake --install ./build --prefix=/usr

		install -Dm644 ./COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

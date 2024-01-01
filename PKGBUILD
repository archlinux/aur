# Maintainer: balaraz <balaraz@tuta.io>

pkgname=sof
pkgver=4.3
pkgrel=2
pkgdesc="Simple and fast calculate size of directories"
license=(GPL3)
url="https://codeberg.org/balaraz/sof"
arch=(x86_64)
depends=()
makedepends=(cmake argumentum gzip)
provides=(sof)
conflicts=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=("48f4576852719a64290998ddc22ce503598e425922f961bf9f363ee15272234f")

package() {
		cd ./sof
		cmake -Bbuild -DCMAKE_BUILD_TYPE=Release -DVERSION=${pkgver}
		cmake --build ./build
		DESTDIR="$pkgdir" cmake --install ./build --prefix=/usr

		install -Dm644 ./COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

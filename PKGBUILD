# Maintainer: balaraz <balaraz@tuta.io>

pkgname=sof
pkgver=4.1
pkgrel=1
pkgdesc="Simple and fast calculate size of directories"
license=(GPL3)
url="https://codeberg.org/balaraz/sof"
arch=(x86_64)
depends=()
makedepends=(cmake argumentum)
provides=(sof sof.1.gz)
conflicts=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=("6b9b2d84161226dcf2f66f3a3e054e8a5c5d092bd65e00a440629446465cf273")

package() {
		cd ./sof
		cmake -Bbuild -DCMAKE_BUILD_TYPE=Release -DVERSION=${pkgver}
		cmake --build ./build
		DESTDIR="$pkgdir" cmake --install ./build --prefix=/usr
}

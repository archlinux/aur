# Maintainer: balaraz <balaraz@tuta.io>

pkgname=sof
pkgver=4.0
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
sha256sums=("a7bc10da2ef01eba47eafc1743e1f39ebd3342c40ee8650bde11a16ac92445fb")

package() {
		cd ./sof
		cmake -Bbuild -DCMAKE_BUILD_TYPE=Release -DVERSION=${pkgver}
		cmake --build ./build
		DESTDIR="$pkgdir" cmake --install ./build --prefix=/usr
}

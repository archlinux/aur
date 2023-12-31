# Maintainer: balaraz <balaraz@tuta.io>

pkgname=sof
pkgver=4.2
pkgrel=2
pkgdesc="Simple and fast calculate size of directories"
license=(GPL3)
url="https://codeberg.org/balaraz/sof"
arch=(x86_64)
depends=()
makedepends=(cmake argumentum)
provides=(sof)
conflicts=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=("a41db914c8c0de9a2a71fc9d7436485747645b8b849ae0bb9e3f75f96831c926")

package() {
		cd ./sof
		cmake -Bbuild -DCMAKE_BUILD_TYPE=Release -DVERSION=${pkgver}
		cmake --build ./build
		DESTDIR="$pkgdir" cmake --install ./build --prefix=/usr
}

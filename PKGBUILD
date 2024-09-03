pkgname=dictpopup
pkgver=0.3.1
pkgrel=1
epoch=1
pkgdesc="A Japanese popup dictionary working on mouse selection with Anki integration"
arch=('any')
license=('GPL-3.0')
groups=()
depends=('gtk3' 'libx11' 'lmdb' 'mecab' 'curl' 'libzip' 'libnotify')
makedepends=('git' 'cmake' 'gperf')
checkdepends=()
optdepends=()
provides=(dictpopup)
conflicts=()
replaces=()
backup=()
options=()
install="$pkgname.install"
changelog=
url="https://github.com/Ajatt-Tools/dictpopup"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
noextract=()
sha256sums=('79a79aa02acd911ae5db284805126a0ca12fbb0d37fa412f44f900049b60cbf7')
validpgpkeys=()

build() {
	cd "${srcdir}"/"${pkgname}-${pkgver}"
	cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTS=OFF
}

package() {
	cd "${srcdir}"/"${pkgname}-${pkgver}"
	cmake --build build -j 3
	cmake --install build --prefix "$pkgdir/usr"
}

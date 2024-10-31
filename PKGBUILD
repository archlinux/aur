pkgname=dictpopup
pkgver=0.3.2
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
changelog=
url="https://github.com/Ajatt-Tools/dictpopup"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
noextract=()
sha256sums=('58183fb736944c17473dfd1f1cc1a365a0269fdef71ce70367a660631803c825')
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

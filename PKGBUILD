pkgname=dictpopup
pkgver=0.2.1
pkgrel=1
epoch=1
pkgdesc="A Japanese popup dictionary working on mouse selection with Anki integration"
arch=('any')
license=('GPL-3.0')
groups=()
depends=('gtk3' 'libx11' 'lmdb' 'mecab' 'curl' 'libzip' 'libnotify')
makedepends=('git')
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
sha256sums=('d060f3102627b62f030f5dc11f727d1ba14a2b4f2f4c703a212725c8b8e3c356')
validpgpkeys=()

build() {
	cd "${srcdir}"/"${pkgname}-${pkgver}"
	cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=OFF
}

package() {
	cd "${srcdir}"/"${pkgname}-${pkgver}"
	cmake --build build -j 2
	cmake --install build --prefix "$pkgdir/usr"
}

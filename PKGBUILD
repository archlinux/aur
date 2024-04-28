pkgname=dictpopup
pkgver=0.1.1
pkgrel=1
epoch=1
pkgdesc="A Japanese popup dictionary working on mouse selection with Anki integration"
arch=('any')
license=('BSD')
groups=()
depends=('gtk3' 'libx11' 'lmdb')
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
url="https://github.com/btrkeks/dictpopup"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
noextract=()
sha256sums=('43a7052f71fcd881b085a959d0d0e6002c896077f6cfd5675e9c24413461f82d')
validpgpkeys=()

build() {
	cd "${srcdir}"/"${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}"/"${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}

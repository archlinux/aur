pkgname=dictpopup
pkgver=0.1.2
pkgrel=3
epoch=1
pkgdesc="A Japanese popup dictionary working on mouse selection with Anki integration"
arch=('any')
license=('BSD')
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
sha256sums=('7491405e247b2e7cae93aaec5a18c5fd8cec7db4ea01118ff0971b6dd810602d')
validpgpkeys=()

build() {
	cd "${srcdir}"/"${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}"/"${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}

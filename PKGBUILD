pkgname=dictpopup
pkgver=0.1.4
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
sha256sums=('d7041edb2b883e5ac0fea3984563a8c6e5af05fa898d6a244e957f7481855cb5')
validpgpkeys=()

build() {
	cd "${srcdir}"/"${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}"/"${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}

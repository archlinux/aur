pkgname=dictpopup
pkgver=r112.0a9a89a
pkgrel=1
epoch=
pkgdesc="A Japanese popup dictionary working on mouse selection with Anki integration"
arch=('any')
url="https://github.com/btrkeks/dictpopup"
license=('BSD 3-Clause')
groups=()
depends=('gtk3' 'libx11' 'lmdb')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install="$pkgname.install"
changelog=
source=("${pkgname}::git+https://github.com/btrkeks/dictpopup.git#branch=master")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}

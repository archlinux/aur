# Maintainer: Pierre Ayoub (Drack) <pierreay@proton.me>

pkgbase=notmuch-tools
pkgname=notmuch-tools-git
pkgver=r87.84c38f0
pkgrel=1
pkgdesc=""
arch=(any)
url="https://framagit.org/manu/notmuch-tools"
license=('GPL')
groups=()
depends=()
makedepends=(git notmuch-runtime glib2-devel gmime3 sqlite)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://framagit.org/manu/${pkgname%-git}")
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make PREFIX="$pkgdir/usr" install
}

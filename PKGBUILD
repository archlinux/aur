# Maintainer: Seppia <seppia@seppio.fish>
pkgname=otbluh-git
pkgver=r80.87c638e
pkgrel=1
pkgdesc="Simple one time pad implementation with key generating support called onetimebluh due to its features"
arch=('i686' 'x86_64' 'aarch64')
url="https://git.eigenlab.org/seppia/onetimebluh"
license=('GPLv3')
groups=()
depends=('openssl')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('otbluh::git+https://git.eigenlab.org/seppia/onetimebluh')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
	cd "$srcdir/${pkgname%-git}"
	make all
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}

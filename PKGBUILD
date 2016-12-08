# Maintainer: Your Name <seppia@seppio.fish>
pkgname=otbluh-git
pkgver=r76.a0ae5aa
pkgrel=1
pkgdesc="simple one time pad implementation with key generating support"
arch=('x86' 'x86_64' 'aarch64')
url="https://git.eigenlab.org/seppia/onetimebluh"
license=('GPLv3')
groups=()
depends=('openssl')
makedepends=('git' 'openssl')
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

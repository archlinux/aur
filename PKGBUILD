# Maintainer: emersion <contact@emersion.fr>
pkgname=mdrgpalu-git
pkgver=v0.1.0.r3.ed19387
pkgrel=1
pkgdesc="A KISS command-line text editor"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/emersion/mdrgpalu"
license=('Unlicense')
groups=()
depends=()
makedepends=('git')
optdepends=('xclip: system-wide clipboard')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/emersion/mdrgpalu.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}

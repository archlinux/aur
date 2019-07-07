# Maintainer: Ignat Insarov <kindaro@gmail.com>

pkgname=havoc-git
pkgver=0
pkgrel=2
pkgdesc='A minimal terminal emulator for Wayland on Linux.'
arch=(x86_64)
url='https://github.com/ii8/havoc'
license=('MIT')
depends=('wayland')
makedepends=('wayland-protocols' 'git')
provides=(havoc)
conflicts=()
source=('git+https://github.com/ii8/havoc')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/havoc"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd havoc
	make PREFIX='/usr'
}

package() {
	cd havoc
	make PREFIX='/usr' DESTDIR="${pkgdir}" install
}

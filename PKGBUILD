# Maintainer: Kamil Kozioł <koziol.kamil@protonmail.com>
pkgname="restree-git"
pkgver=r33.e322d46
pkgrel=1
pkgdesc="Simple CLI tool to recursively build .http file in a given directory"
arch=('x86_64')
url="https://github.com/kamil-koziol/restree"
license=('GPL-3.0')
makedepends=('git' 'go')
provides=("restree")
conflicts=("restree")
source=("git+$url")
sha256sums=('SKIP')
options=('!debug')

pkgver() {
	cd restree
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd restree
    make build
}

package() {
	cd restree
    make DESTDIR="$pkgdir" PREFIX=/usr install
}

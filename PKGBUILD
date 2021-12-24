# Maintainer: nihilowy <nihilowy at gmail dot com>

pkgname=surfer-git
pkgver=r300.e0b13a1
pkgrel=1
epoch=1
pkgdesc="simple webkit2gtk browser"
arch=('i686' 'x86_64')
url="https://github.com/nihilowy/surfer"
license=('GPL')
makedepends=('git')
depends=('webkit2gtk')
source=("git+https://github.com/nihilowy/surfer.git")
sha256sums=('SKIP')

_gitname=surfer

pkgver() {
	cd "$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_gitname"
	make
}

package() {
	cd "$_gitname"
	make DESTDIR="$pkgdir/" install
}

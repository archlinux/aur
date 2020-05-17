# Maintainer: Jay Tauron <jytrn@protonmail.com>
# Thanks to https://github.com/yochananmarqos for the PKGBUILD
pkgname=oreo-nord-cursors-git
pkgver=20200517.r40.3fd7a4b
pkgrel=1
epoch=
pkgdesc="Fork of oreo-cursors with Nord colors"
arch=('any')
url="https://github.com/0jdxt/oreo-nord-cursors"
license=('GPL2')
makedepends=('git' 'gtk-engine-murrine' 'inkscape' 'xorg-xcursorgen')
provides=()
conflicts=()
options=('!strip')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "20200516.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	make clean
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}

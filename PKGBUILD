# Maintainer: melchips <truphemus dot francois at gmail dot com>
pkgname=gluqlo-git
pkgver=r25.b36de79
pkgrel=1
pkgdesc="Flip clock screensaver like Fliqlo"
arch=('x86_64')
url="https://github.com/alexanderk23/gluqlo"
license=('custom:isc')
groups=()
depends=('sdl' 'sdl_ttf' 'sdl_gfx')
optdepends=('xscreensaver')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('gluqlo::git+https://github.com/alexanderk23/gluqlo.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
	cp LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
}

# Maintainer: steamport <steamport@protonmail.com>
pkgname=kristforge-git
pkgver=r27.af563f6
pkgrel=1
pkgdesc="An unofficial package for kristforge. Kristforge is an OpenCL-accelerated krist miner, capable of very high speeds, with vector type support"
arch=('x86_64')
url="https://github.com/apemanzilla/kristforge"
license=('MIT')
groups=()
depends=('openssl' 'ocl-icd' 'jsoncpp' 'curl' 'uwebsockets')
makedepends=('git' 'tclap' 'cmake' 'vim')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('kristforge::git+https://github.com/tmpim/kristforge.git#branch=legacy')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/kristforge"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/kristforge"
	cmake .
	make
}


package() {
	mkdir -p "$pkgdir/usr/bin"
	cp "$srcdir/kristforge/kristforge" "$pkgdir/usr/bin/kristforge"
}

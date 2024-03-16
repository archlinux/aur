# Maintainer: Lonny Wong <lonnywong@qq.com>
pkgname="tssh"
pkgver="0.1.19"
pkgrel=1
epoch=0
pkgdesc="Simple ssh client with trzsz ( trz / tsz ) support."
arch=("x86_64" "i686" "aarch64")
url="https://trzsz.github.io/ssh"
license=("MIT")
groups=()
depends=()
makedepends=("go>=1.20.3")
checkdepends=()
optdepends=()
provides=("tssh")
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/trzsz/trzsz-ssh/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
md5sums=('d577fa496fb05a934f04c38b41796f67')
validpgpkeys=()

build() {
	cd "trzsz-ssh-$pkgver"
	make
}

package() {
	cd "trzsz-ssh-$pkgver"
	make DESTDIR="$pkgdir" install
}

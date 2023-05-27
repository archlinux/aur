# Maintainer: éclairevoyant
# Contributor: aksr <aksr at t-com dot me>
# Contributor: Dave Reisner <d at falconindy dot com>

_pkgname=inotail
pkgname="$_pkgname-git"
pkgver=r270.a449425
pkgrel=1
pkgdesc="inotify-based implementation of tail"
arch=(i686 x86_64)
url="https://distanz.ch/$_pkgname"
license=(GPL2)
depends=(glibc)
makedepends=(git)
source=("git://git.distanz.ch/$_pkgname.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	make -C $_pkgname
}

package() {
	make -C $_pkgname prefix="$pkgdir/usr" install
}

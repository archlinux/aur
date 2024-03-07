# Maintainer: Jeremy Baxter <jtbx@disroot.org>

pkgname=callisto-git
pkgver=0_gitbd664d10c2dee5e772b9bc3beb6a6f4bdc4203ae
pkgrel=1
pkgdesc='standalone scripting platform for Lua 5.4'
arch=('x86_64')
url='https://sr.ht/~jeremy/callisto/'
depends=(readline)
makedepends=(git)
license=(GPL)
options=('!emptydirs')
source=("$pkgname::git+https://git.sr.ht/~jeremy/callisto")
sha256sums=('SKIP')

pkgver() {
	printf "0_git"
	git -C "$pkgname" rev-parse HEAD
}

build() {
	cd "$pkgname"
	./configure -wreadline
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" PREFIX=/usr install
}

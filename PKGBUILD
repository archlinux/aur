# Maintainer: Zacharias Knudsen <zachasme@gmail.com>
pkgname=h3-pg-git
pkgver=v0.3.1.r0.g8089502
pkgrel=1
pkgdesc="PostgreSQL bindings for H3, a hierarchical hexagonal geospatial indexing system"
arch=('x86_64')
url="https://github.com/bytesandbrains/h3-pg"
license=('Apache')
depends=('h3-git')
makedepends=('git' 'make' 'gcc')
source=("$pkgname::git+https://github.com/bytesandbrains/h3-pg.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $pkgname
	make
}

package() {
	cd $pkgname
	make DESTDIR="$pkgdir/" install
}

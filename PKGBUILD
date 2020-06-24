# Maintainer: Brodie Robertson <brodierobertsonbusiness@gmail.com>
pkgname='tiramisu-git'
_pkgname='tiramisu'
pkgver=r37.3f125e0
pkgrel=1
pkgdesc="Desktop notifications, the UNIX way"
makedepends=("git")
arch=('x86_64')
url="https://github.com/Sweets/tiramisu"
license=('MIT')
depends=('glib2' 'glibc' 'zlib' 'libutil-linux' 'libffi' 'pcre')
source=('tiramisu::git://github.com/Sweets/tiramisu.git')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	make
}

package() {
	cd "$_pkgname"
	install -Dm755 ./tiramisu "$pkgdir/usr/bin/tiramisu"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname"
}

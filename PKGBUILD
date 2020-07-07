# Maintainer: Brodie Robertson <brodierobertsonbusiness at gmail dot com>
# Contributor: Lennard Hofmann <lennard dot hofmann at web dot de>

pkgname='tiramisu-git'
_pkgname='tiramisu'
pkgver=r59.3b30a0f
pkgrel=2
pkgdesc="Desktop notifications, the UNIX way"
makedepends=("git")
arch=('x86_64')
url="https://github.com/Sweets/tiramisu"
license=('MIT')
depends=('glib2')
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
  install -Dm644 ./README.md -t "$pkgdir/usr/share/doc/$_pkgname/"
  install -Dm644 ./LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# Maintainer: Ács Zoltán <acszoltan111 at gmail dot com>
# Contributor: Brodie Robertson <brodierobertsonbusiness at gmail dot com>
# Contributor: Lennard Hofmann <lennard dot hofmann at web dot de>

pkgname='tiramisu-git'
_pkgname='tiramisu'
pkgver=r159.55cec2d
pkgrel=1
pkgdesc="Desktop notifications, the UNIX way"
makedepends=("vala")
arch=('x86_64')
url="https://github.com/Sweets/tiramisu"
license=('MIT')
depends=('glib2')
source=('tiramisu::git+https://github.com/Sweets/tiramisu.git')
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

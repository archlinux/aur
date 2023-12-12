# Maintainer: RifsxD <33044977+rifsxd at users dot noreply dot github dot com>

pkgname=kittyfetch
pkgver=2.1.0
pkgrel=1
pkgdesc='Kittyfetch is a cute little and fast tool for fetching info about your system'
arch=('any')
url='https://github.com/rifsxd/kittyfetch'
license=('MIT')
provides=('kittyfetch')
conflicts=('kittyfetch')
depends=('libx11')
makedepends=('make' 'gcc')
source=("git+$url.git")
sha256sums=('SKIP')
validpgpkeys=(
	'CBBF9D68F47D02341D96BCC66B5BBC16B3AB9113' # Rifat Azad <33044977+rifsxd@users.noreply.github.com>
)

build() {
  cd "$pkgname/src"
  make clean build
}

package() {
	cd "$pkgname"
	install -D "src/build/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
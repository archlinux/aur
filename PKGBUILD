# Maintainer: RifsxD <33044977+rifsxd at users dot noreply dot github dot com>

pkgname=blazefetch
pkgver=2.6.4
pkgrel=2
pkgdesc='A lite & blazing fast system info fetch utility'
arch=('any')
url='https://github.com/rifsxd/blazefetch'
license=('MIT')
provides=('blazefetch')
conflicts=('blazefetch')
depends=('libx11' 'networkmanager' 'playerctl')
makedepends=('make' 'gcc')
source=("git+$url.git")
sha256sums=('SKIP')
validpgpkeys=(
	'SKIP'
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
# Maintainer: RifsxD <33044977+rifsxd at users dot noreply dot github dot com>

pkgname=blazefetch
pkgver=2.7.6
pkgrel=3
pkgdesc='A lite & blazing fast system info fetch utility'
arch=('any')
url='https://github.com/rifsxd/blazefetch'
license=('MIT')
provides=('blazefetch')
conflicts=('blazefetch')
depends=('libx11' 'networkmanager' 'playerctl')
makedepends=('cmake' 'ninja' 'gcc')
source=("git+$url.git")
sha256sums=('SKIP')

build() {
  	cd "$pkgname/src"
	mkdir build
  	cd build 
  	cmake -G Ninja ..
  	ninja
}

package() {
	cd "$pkgname"
	install -D "src/build/bin/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
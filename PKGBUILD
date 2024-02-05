# Maintainer: RifsxD <33044977+rifsxd at users dot noreply dot github dot com>

pkgname=blazefetch
pkgver=2.8.1
pkgrel=1
pkgdesc='A lite & blazing fast system info fetch utility'
arch=('any')
url='https://github.com/rifsxd/blazefetch'
license=('MIT')
provides=('blazefetch')
conflicts=('blazefetch-git')
depends=('libx11' 'networkmanager' 'playerctl' 'figlet')
makedepends=('cmake' 'ninja' 'gcc')
source=("$url/releases/download/$pkgver/src-$pkgname-$pkgver.tar.gz")
sha256sums=('bd0ac6a795c9c937635b39da25c592fd7be9c873c8320bb42d335022c5e2659b')

build() {
	mkdir build
  	cd build 
  	cmake -G Ninja ..
  	ninja
}

package() {
	install -D "build/bin/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# Maintainer: RifsxD <33044977+rifsxd at users dot noreply dot github dot com>

pkgname=blazefetch
pkgver=2.9.3
pkgrel=1
pkgdesc='A lite & blazing fast system info fetch utility'
arch=('any')
url='https://github.com/rifsxd/blazefetch'
license=('MIT')
provides=('blazefetch')
conflicts=('blazefetch-git')
depends=('libx11' 'networkmanager' 'playerctl' 'figlet' 'pciutils' 'mesa-utils')
makedepends=('cmake' 'ninja' 'gcc')
source=("$url/releases/download/$pkgver/src-$pkgname-$pkgver.tar.gz")
sha256sums=('85134351b0f446abc59d6d0fe812d5d930d3eb9a4790d1a8aba197a3c5826c3f')

build() {
	rm -rf build
	mkdir build
  	cd build 
  	cmake -G Ninja ..
  	ninja
}

package() {
	install -D "build/bin/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

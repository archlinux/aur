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
sha256sums=('cc576a92fcffb0c135d223566dad03f4e7e7db11e362ee34d252b4c5af3b67af')

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

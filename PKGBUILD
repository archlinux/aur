# Maintainer: RifsxD <33044977+rifsxd at users dot noreply dot github dot com>

pkgname=blazefetch-git
_pkgname=blazefetch
pkgver=20240205s
pkgrel=1
pkgdesc='A lite & blazing fast system info fetch utility'
arch=('any')
url='https://github.com/rifsxd/blazefetch'
license=('MIT')
provides=('blazefetch-git')
conflicts=('blazefetch')
depends=('libx11' 'networkmanager' 'playerctl' 'figlet')
makedepends=('cmake' 'ninja' 'gcc')
source=("git+$url.git")
sha256sums=('SKIP')

build() {
  	cd "$_pkgname/src"
	mkdir build
  	cd build 
  	cmake -G Ninja ..
  	ninja
}

package() {
	cd "$_pkgname"
	install -D "src/build/bin/$_pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
}

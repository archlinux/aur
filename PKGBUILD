# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=terpod
pkgver=0.1.0
pkgrel=1
pkgdesc="A terminal podcast manager"
url="https://github.com/samhh/terpod/"
arch=('x86_64')
license=('AGPL')
source=("$pkgname-$pkgver.tar.gz::https://github.com/samhh/terpod/archive/$pkgver.tar.gz")
md5sums=('5adb27ed117794cffb3903c6594f9dc8')

build() {
	echo "Please note that the \"cabal\" command is required for building. A makedepends has yet to be set pending a better understanding of how this dependency should be handled."
	cd "$pkgname-$pkgver"
	cabal build "$pkgname"
}

package() {
	cd "$pkgname-$pkgver"
	ls dist-newstyle/build/x86_64-linux/*/*/x/terpod/build/terpod/
	install -Dm 755 dist-newstyle/build/x86_64-linux/*/*/x/terpod/build/terpod/terpod "$pkgdir/usr/bin/$pkgname"
}


# Maintainer: Ragnar Laud <ragnar.laud@hotmail.com>
pkgname=go-pdirs
pkgrel=2
pkgver=0.1.2
pkgdesc="Project directory resolver"
arch=(x86_64)
url="https://github.com/xprnio/$pkgname"
license=(MIT)
depends=(go make)
makedepends=(git)
provides=($pkgname)
conflicts=($pkgname-git)

source=("https://github.com/xprnio/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('2a02afb13bcfca8b0057a48812cbdd8de0e8e3ebe007abeeb37eb26c9882268b')

build() {
  cd $pkgname-$pkgver
  make build
}

check() {
  cd $pkgname-$pkgver
	make test
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 "bin/go-pdirs" "$pkgdir/usr/bin/$pkgname"
}

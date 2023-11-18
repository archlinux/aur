# Maintainer: Ragnar Laud <ragnar.laud@hotmail.com>
pkgname=go-pdirs
pkgrel=2
pkgver=0.1.1
pkgdesc="Project directory resolver"
arch=(x86_64)
url="https://github.com/xprnio/$pkgname"
license=(MIT)
depends=(go make)
makedepends=(git)
provides=($pkgname)
conflicts=($pkgname-git)

source=("https://github.com/xprnio/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('7aaea62e7a6bb8b46ce1c0e75c76ef083198d314545c4c93ef5dead5fe1b08cd')

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
	install -Dm755 "scripts/pcd" "$pkgdir/usr/bin/pcd"
}

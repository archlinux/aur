# Maintainer: Ragnar Laud <ragnar.laud@hotmail.com>
pkgname=go-pdirs
pkgrel=1
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
sha256sums=('399d3da30aaaa154eb186c66c827397ad4e439b8871592cc82794e0dfd8df1e6')

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

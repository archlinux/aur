# Maintainer: Ragnar Laud <ragnar.laud@hotmail.com>
_pkgname=go-pdirs
pkgname=$_pkgname-git
pkgrel=1
pkgver=0.1.0
pkgdesc="Project directory resolver"
arch=(x86_64)
url="https://github.com/xprnio/$_pkgname"
license=(MIT)
depends=(go make)
provides=($_pkgname)
conflicts=($_pkgname)

source=("git+$url.git")
sha256sums=('SKIP')

build() {
	cd $_pkgname
  make build
}

check() {
	cd $_pkgname
	make test
}

package() {
	cd $_pkgname
	echo "List of current directory"
	ls
  install -Dm755 "bin/go-pdirs" "$pkgdir/usr/bin/$_pkgname"
}

# Maintainer: gyara <laxect39@gmail.com>

pkgname=desync-git
_pkgname=desync
pkgver=r271.b545768
pkgrel=1
pkgdesc="Alternative casync implementation in Go"
url="https://github.com/folbricht/desync"
makedepends=("go" "git")
provides=("desync")
license=("BSD")
arch=("i686" "x86_64" "arm" "armv6h" "armv7h" "aarch64")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $_pkgname/cmd/desync
	go build .
}

package() {
	cd $_pkgname/cmd/desync
	install -Dm755 $_pkgname $pkgdir/usr/bin/$_pkgname
}

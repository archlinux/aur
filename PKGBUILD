# Maintainer: Burak <burakberkkeskin@gmail.com>
pkgname=coineus-server-git
pkgver=1.0.r3.c173c2f
pkgrel=1
pkgdesc="Coineus App Backend"
arch=(x86_64)
url="https://github.com/safderun/coineus-server-aur"
license=('MIT')
depends=()
makedepends=(git go)
provides=(coineus-server)
conflicts=(coineus-server)
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "${_pkgname}"
  printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "coineus-server-aur/cmd/server"
	go build .
}

package() {
	install -Dm 755 "coineus-server-aur/cmd/server/server" "$pkgdir/usr/bin/cserver"
}

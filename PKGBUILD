# Maintainer: Burak <burakberkkeskin@gmail.com>
pkgname=coineus-server-git
_pkgname=coineus-server
pkgver=1.0.r68.1abe6e5
pkgrel=1
pkgdesc="Coineus App Backend"
arch=(x86_64)
url="https://github.com/coineus/coineus-server"
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
	cd "$_pkgname/cmd/server"
	go build .
}

package() {
	install -Dm 755 "$_pkgname/cmd/server/server" "$pkgdir/usr/bin/cserver"
}

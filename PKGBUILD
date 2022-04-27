# Maintainer: 4censord <mail@business-insulting.de>
pkgname=subspace-git
pkgver=r223.7d12b87
pkgrel=2
epoch=
pkgdesc="A Wireguard management interface"
arch=('x86_64')
url="https://github.com/subspacecommunity/subspace"
license=('GPL')
depends=()
makedepends=('go-bindata' 'go' 'git')
provides=($pkgname=$pkgver)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+https://github.com/subspacecommunity/subspace")
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	make build
}

package() {
	cd "$pkgname"
	install -Dm755 subspace ${pkgdir}/usr/bin/subspace
}

# Maintainer: zargbell <zargbell@yandex.ru>

pkgname=pixiecore
pkgver=16.12.24.1326
pkgrel=1
epoch=
pkgdesc="An all-in-one tool for easy netbooting"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/google/netboot/tree/master/pixiecore"
license=('GPL2')
groups=()
depends=()
makedepends=('go' 'git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=()
#validpgpkeys=()


prepare() {
	export GOPATH="$srcdir/go"
	mkdir -p $GOPATH

	export GOBIN="$GOPATH/bin"
	mkdir -p $GOBIN

	go env
}

build() {
	go get -v go.universe.tf/netboot/cmd/pixiecore
}

package() {
	install -Dm755 "$GOBIN/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# Maintainer: Harm Endres <harm.mueller@gmail.com>

pkgname=waitron
pkgver=0.0.1
pkgrel=2
pkgdesc="Waitron will deliver a kernel/initrd/commandline set to be used by pixiecore."
arch=('any')
url="https://github.com/jhaals/waitron"
license=('Apache')
makedepends=('go' 'git')

prepare() {
	export GOPATH="$srcdir/go"
	mkdir -p $GOPATH

	export GOBIN="$GOPATH/bin"
	mkdir -p $GOBIN

	go env
}

build() {
	go get -v github.com/jhaals/waitron
}

package() {
	install -Dm755 "$GOBIN/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

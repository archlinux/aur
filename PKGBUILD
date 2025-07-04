# Maintainer: Evan Burkey <evan@burkey.co>
pkgname=epochcli
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="Updater and launcher for Project Epoch"
arch=('x86_64')
url="https://git.burkey.co/eburk/epochcli"
license=('ISC')
makedepends=('go>=1.24.0')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("git+https://git.burkey.co/eburk/epochcli#commit=134d70e29b3b19365e2ccdd879c2421b9fb5dfac") 
noextract=()
sha256sums=("SKIP")

build() {
	msg "Building the bee binaries"
	msg2 "using gopath $GOPATH"
	pushd epochcli
	go build
}

package() {
	pushd epochcli 
	install -v -D -m0755 epochcli ${pkgdir}/usr/bin/epochcli
}

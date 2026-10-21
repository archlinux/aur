# Maintainer: Charles Dong <chardon_cs@proton.me>

pkgname=cargo-fframes
pkgver=1.3.0
pkgrel=1
epoch=
pkgdesc="Programmatic video rendering framework that is actually fast"
arch=("any")
url="https://github.com/dmtrKovalenko/fframes"
license=('MIT')
groups=()
depends=(ninja yasm nasm ffmpeg x264 x265 opus clang)
makedepends=(rust cargo)
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
sha256sums=()
validpgpkeys=()

_basedir="fframes-$pkgver"

build() {
    mkdir -p $_basedir
	cd $_basedir
    mkdir -p ./target ./base
    cargo install cargo-fframes --locked --root ./target
}

package() {
	cd $_basedir

    install -Dm755 ./target/bin/cargo-fframes -t $pkgdir/usr/bin
}

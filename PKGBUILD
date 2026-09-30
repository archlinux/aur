# Maintainer: Charles Dong <chardon_cs@proton.me>

pkgname=cargo-fframes
pkgver=1.1.0
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
source=("fframes-${pkgver}.tar.gz::https://github.com/dmtrKovalenko/fframes/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('a326b54416a70b0eafc33ece5edfa183eac7650eaac8b04f7c47ba862b925f79')
validpgpkeys=()

_basedir="fframes-$pkgver"

build() {
	cd $_basedir
    cargo build --release --locked -p cargo-fframes
}

check() {
	cd $_basedir
    cargo test -p cargo-fframes
}

package() {
	cd $_basedir

    install -Dm755 ./target/release/cargo-fframes -t $pkgdir/usr/bin
    install -Dm644 ./LICENSE.txt -t $pkgver/usr/share/licenses/cargo-fframes
}

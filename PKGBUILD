# Maintainer: Charles Dong <chardon_cs@proton.me>

pkgname=cargo-fframes
pkgver=1.0.1
pkgrel=1
epoch=
pkgdesc="Write some Rust. Get video. Enjoy 🥤🍿"
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
sha256sums=('10820edbcfcb081beaf64b24dee9ac7dfd8721848e679e0830affce3e47d7350')
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

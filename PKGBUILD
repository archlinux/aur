# Maintainer: Charles Dong <chardon_cs@proton.me>

pkgname=justshell
pkgver=0.3.4
pkgrel=1
pkgdesc="Simple webapp wrapper"
arch=("x86_64" "aarch64")
url="https://github.com/chardoncs/justshell"
license=('MIT')
groups=()
depends=(
    "gtk4"
    "webkitgtk-6.0"
)
makedepends=(
    "rust"
    "cargo"
)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/chardoncs/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=("8ddc3d0a4c8db224b9eec3f376bea3c797c9bf9502ca77841a0044c6184aa6e5")
validpgpkeys=()

_srcroot="${pkgname}-${pkgver}-${pkgrel}"

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"

    install --mode 755 -D -t "$pkgdir/usr/bin" target/release/${pkgname}
    install --mode 644 -D -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

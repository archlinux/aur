# Maintainer: Charles Dong <chardon_cs@proton.me>

pkgname=justshell
pkgver=0.3.2
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
sha256sums=("7b80e9021ef99211dca07de96bc8de354d09986128f6e2714802e70c74209d7a")
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

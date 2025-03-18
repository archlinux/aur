# Maintainer: Charles Dong <chardon_cs@proton.me>

pkgname=justshell
pkgver=0.3.3
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
sha256sums=("cc53ffc7d9ef2016718e53fd223d1df8580fb3dfd42ea395efa4f1b2b43a8a4e")
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

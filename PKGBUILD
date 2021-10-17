# Maintainer: Gaoyang Zhang <gy@blurgy.xyz>
pkgname=dt-cli
pkgver=0.2.1
pkgrel=1
epoch=
pkgdesc="Syncing dotfiles and more"
arch=("any")
url="https://github.com/blurgyy/dt"
license=('MIT OR Apache 2.0')
groups=()
depends=()
makedepends=(
    cargo
    curl
)
checkdepends=()
optdepends=()
provides=("dt-cli")
conflicts=("dt-cli-git" "dt-cli-bin")
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/blurgyy/dt/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("e4963bb74b0335f30138db990011ea225bbb5389b86a1edc612c2e994cd2c2dd")
noextract=()
validpgpkeys=()

build() {
    cd "dt-$pkgver"
    cargo build --bin=dt-cli --release --all-features
}

check() {
    cd "dt-$pkgver"
    cargo test --release --all-features
}

package() {
    cd "dt-$pkgver"
    install -Dm755 "target/release/dt-cli" "$pkgdir/usr/bin/dt-cli"
    install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/dt/LICENSE-APACHE"
    install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/dt/LICENSE-MIT"
}

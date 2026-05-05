# Maintainer: 404mon <daemn404@gmail.com>
pkgname=netchi
pkgver=1.0.0
pkgrel=1
pkgdesc="Autonomous AI-driven network reconnaissance cyberdeck (Network Tamagotchi)"
arch=('x86_64')
url="https://github.com/404mon/netchi"
license=('GPL3')
depends=('nmap' 'libpcap' 'webkit2gtk' 'gtk3')
makedepends=('cargo' 'npm' 'nodejs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c0ccc499e1e9d286f230d8fbcb6b7ea31ece2fc05e0e31ed58b9e1ff203965c2')
install='netchi.install'

build() {
    cd "$pkgname-$pkgver"
    npm install
    cargo tauri build
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "src-tauri/target/release/netchi" "$pkgdir/usr/bin/netchi"
}

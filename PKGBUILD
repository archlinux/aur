# Maintainer: Byson94 <byson94wastaken@gmail.com>
pkgname=ewwii
pkgver=0.2.0
pkgrel=1
pkgdesc="Powerful and flexible widget system for Linux"
arch=('x86_64')
url="https://github.com/Ewwii-sh/ewwii"
license=('GPL')
depends=()
makedepends=('cargo' 'gtk3' 'pkgconf')
provides=('ewwii')
conflicts=('ewwii-bin' 'ewwii')
source=("https://github.com/Ewwii-sh/ewwii/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6f92fe92795b199aca6b41eec5fbaf427de3b70c06b809a86dcc033e4f1c10ac')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -Dm755 "target/release/ewwii" "$pkgdir/usr/bin/ewwii"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

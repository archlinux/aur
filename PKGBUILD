# Maintainer: Julian Y. Richard Corbet (julian-corbet on GitHub)
pkgname=cksk
pkgver=0.1.0
pkgrel=1
pkgdesc="Server-monitor boards for a clck kiosk display"
arch=('x86_64')
url="https://github.com/corbet-labs/cksk"
license=('LicenseRef-FSL-1.1-ALv2')
depends=()
makedepends=('cargo' 'git')
provides=('cksk')
conflicts=('cksk-bin')
source=("$pkgname::git+https://github.com/corbet-labs/cksk.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "$pkgname"
    cargo build --release --frozen --bin cksk
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/cksk" "$pkgdir/usr/bin/cksk"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

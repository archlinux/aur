# Maintainer: Linus <jh@orbt.sh>
pkgname=orbt
pkgver=0.1.8
pkgrel=1
pkgdesc="Universal terminal workspace — sessions, panes, and AI agents"
arch=('x86_64')
url="https://github.com/linuszz/orbt"
license=('AGPL-3.0-only')
depends=('gcc-libs')
makedepends=('rust' 'cargo' 'cmake' 'pkg-config' 'openssl')
provides=('orbt')
conflicts=('orbt-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/linuszz/orbt/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "orbt-${pkgver}"
    cargo build -p orbt --release --locked
}

package() {
    cd "orbt-${pkgver}"
    install -Dm755 "target/release/orbt" "${pkgdir}/usr/bin/orbt"
}

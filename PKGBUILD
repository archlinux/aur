pkgname=cmdflow
pkgver=0.2.6
pkgrel=1
pkgdesc="A colorful Fish command tracker with rainbow top visualization"
arch=('x86_64')
url="https://github.com/voideez/cmdflow"
license=('MIT')
depends=('bash')
depends=('fish')
makedepends=('rust')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/voideez/cmdflow/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/cmdflow"   # заход в подпапку с Cargo.toml
    cargo build --release
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/cmdflow"
    install -Dm755 target/release/cmdflow "${pkgdir}/usr/bin/cmdflow"
}



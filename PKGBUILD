pkgname=inori
pkgver=0.3.0
pkgrel=1
pkgdesc="terminal mpd client with effective searching"
arch=('x86_64')
url="https://github.com/eshrh/inori"
license=('GPL-3.0')
depends=('mpd')
makedepends=('rust')
source=("inori-${pkgver}.tar.gz::https://github.com/eshrh/inori/archive/v${pkgver}.tar.gz")
sha256sums=('5b120d14428329598232ccb80c0caccf64b1210068b26ebf228ac654db18d01a')
conflicts=()

build() {
    cd ${pkgname}-${pkgver}
    cargo build --release --locked --target-dir=target
}


package() {
    cd "inori-${pkgver}"
    install -Dvm755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}

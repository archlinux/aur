pkgname=inori
pkgver=0.2.4
pkgrel=1
pkgdesc="terminal mpd client with effective searching"
arch=('x86_64')
url="https://github.com/eshrh/inori"
license=('GPL-3.0')
depends=('mpd')
makedepends=('rust')
source=("inori-${pkgver}.tar.gz::https://github.com/eshrh/inori/archive/v${pkgver}.tar.gz")
sha256sums=('0d2239e36f47c781a0fdfe09dd6538ae0470551f041363981d0692fa877986da')
conflicts=()

build() {
    cd ${pkgname}-${pkgver}
    cargo build --release --locked --target-dir=target
}


package() {
    cd "inori-${pkgver}"
    install -Dvm755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}

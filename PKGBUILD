pkgname=inori
pkgver=0.2.6
pkgrel=1
pkgdesc="terminal mpd client with effective searching"
arch=('x86_64')
url="https://github.com/eshrh/inori"
license=('GPL-3.0')
depends=('mpd')
makedepends=('rust')
source=("inori-${pkgver}.tar.gz::https://github.com/eshrh/inori/archive/v${pkgver}.tar.gz")
sha256sums=('6c3f655ebec52309c882346ed219c68a5fc4a80d0bef5822ec85ce383b145614')
conflicts=()

build() {
    cd ${pkgname}-${pkgver}
    cargo build --release --locked --target-dir=target
}


package() {
    cd "inori-${pkgver}"
    install -Dvm755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}

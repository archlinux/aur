pkgname=inori
pkgver=0.4.1
pkgrel=1
pkgdesc="terminal mpd client with effective searching"
arch=('x86_64')
url="https://github.com/eshrh/inori"
license=('GPL-3.0')
depends=('mpd')
makedepends=('rust')
source=("inori-${pkgver}.tar.gz::https://github.com/eshrh/inori/archive/v${pkgver}.tar.gz")
sha256sums=('b7e5b7f979a50332c5f578bfe225cba6a97c409079240a00d06114e5823dfec1')
conflicts=()

build() {
    cd ${pkgname}-${pkgver}
    cargo build --release --locked --target-dir=target
}


package() {
    cd "inori-${pkgver}"
    install -Dvm755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}

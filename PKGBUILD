# Maintainer: Kushagra Sharma <tda@thedarkartist.in>
pkgname=ipclip
pkgver=1.0.0
pkgrel=1
pkgdesc="A Rust program to copy the local IP address to the clipboard using shell commands."
arch=('x86_64')
url="https://github.com/TheDarkArtist/ipclip"
license=('MIT')
depends=('xclip')
makedepends=('git')
provides=('ipclip')
conflicts=('ipclip')
options=(!debug)
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/TheDarkArtist/ipclip/archive/v${pkgver}.tar.gz"
    "ipclip-1.0.0.tar.gz.asc"
)
sha256sums=(
    '979317c6462b9ea89a40abb7c69e3cebe8bb04c7ee4f9c926e33e0e4c86d45d5'
    '7b6aeac98c5c94f53813936758c992da23ba2238301387ae9054592b9643ef2a'
)
validpgpkeys=(
    '0AD355085DF79157D5CD05C3F871B76C837E1BC4' # Kushagra Sharma
)

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin/"
}



# Maintainer: Jake Stanger <mail at jstanger dot dev>
pkgname=ironbar-bin
_pkgname=ironbar
pkgver=0.18.0
pkgrel=1
pkgdesc="Customisable Wayland gtk bar written in Rust. "
arch=(
    'aarch64'
    $CARCH
)
url="https://github.com/jakestanger/ironbar"
license=('MIT')
provides=("ironbar")
conflicts=("ironbar")
depends=(
    'gtk4' 
    'gtk4-layer-shell' 
    'luajit'
    'lua51-lgi' 
    'libinput' 
    'libpulse'
)

source=("https://raw.githubusercontent.com/JakeStanger/ironbar/refs/heads/master/LICENSE")

source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-arm64.tar.gz")
source_x86_64=("${_pkgname}-${pkgver}-$CARCH.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64.tar.gz")

sha256sums=('563e19d17778199999882de9dd1160fb1381f33c9712f310af6c07a2c4c3deb2')
sha256sums_aarch64=('02642e29211e7b75a7e92bff91fe1a718c043d3c97fcb6feb3ada4a893de2273')
sha256sums_x86_64=('dba5d170f799f1064239eaf840bc636f6c89df8902b8abca85d97319752cb8b1')

package() {
    install -Dm 755 "$srcdir/ironbar" "$pkgdir/usr/bin/ironbar"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

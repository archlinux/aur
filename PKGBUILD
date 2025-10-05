
# Maintainer: Jake Stanger <mail at jstanger dot dev>
pkgname=ironbar-bin
_pkgname=ironbar
pkgver=0.17.1
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
    'gtk3' 
    'gtk-layer-shell' 
    'luajit'
    'lua51-lgi' 
    'libdbusmenu-glib' 
    'libdbusmenu-gtk3'
    'libinput' 
    'libpulse'
)

source=("https://raw.githubusercontent.com/JakeStanger/ironbar/refs/heads/master/LICENSE")

source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-arm64.tar.gz")
source_x86_64=("${_pkgname}-${pkgver}-$CARCH.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64.tar.gz")

sha256sums=('563e19d17778199999882de9dd1160fb1381f33c9712f310af6c07a2c4c3deb2')
sha256sums_aarch64=('67fdd53bfed002b7154a68c42208d3260059d6e64be90b146368bd383e3f1261')
sha256sums_x86_64=('f921a08d95bb11ab79c69b92772ce624dcd8553da10a79dd3d0bec58408ab07f')

package() {
    install -Dm 755 "$srcdir/ironbar" "$pkgdir/usr/bin/ironbar"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

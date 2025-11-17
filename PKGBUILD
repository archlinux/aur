# Maintainer: hyprarcher <hyprarcher@proton.me>
pkgname=wayscriber-bin
pkgver=0.7.0
pkgrel=1
pkgdesc='Screen annotation tool for Wayland compositors (prebuilt binaries)'
arch=('x86_64')
url='https://wayscriber.com'
license=('MIT')
install=wayscriber-bin.install
depends=(
    'cairo'
    'wayland'
    'pango'
    'gcc-libs'
    'glibc'
    'wl-clipboard'
    'grim'
    'slurp'
)
provides=('wayscriber' 'wayscriber-configurator')
conflicts=('wayscriber' 'wayscriber-debug')
replaces=('wayscriber-debug')
source_x86_64=("wayscriber-v${pkgver}-linux-x86_64.tar.gz::https://github.com/devmobasa/wayscriber/releases/download/v${pkgver}/wayscriber-v${pkgver}-linux-x86_64.tar.gz")
sha256sums_x86_64=('eb3c9033b11ba363c418e55bd6adc7ae3d5295a98831806bf20a9a862be81b72')

_tarball="wayscriber-v${pkgver}-linux-${CARCH}.tar.gz"

package() {
    tar -xzf "${srcdir}/${_tarball}" -C "${pkgdir}" --strip-components=1
}

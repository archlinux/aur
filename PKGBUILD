# Maintainer: hyprarcher <hyprarcher@proton.me>
pkgname=wayscriber-bin
pkgver=0.7.2
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
sha256sums_x86_64=('7237c9e7fbb61317b7420fddd2fb1788967d690213b3a02fc3555e2f62cbd562')

_tarball="wayscriber-v${pkgver}-linux-${CARCH}.tar.gz"

package() {
    tar -xzf "${srcdir}/${_tarball}" -C "${pkgdir}" --strip-components=1
}

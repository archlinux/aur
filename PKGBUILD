# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=shedshield-bin
pkgver=0.0.1_beta
pkgrel=1
pkgdesc="A cross-platform application that shuts down your desktop PC before loadshedding"
arch=('x86_64')
url="https://github.com/ZJouba/ShedShield"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('alsa-lib' 'nss' 'glibc' 'libxdamage' 'expat' 'libx11' 'libxkbcommon' 'libxrandr' 'nspr' 'libdrm' 'cairo' 'glib2' \
    'libxcomposite' 'at-spi2-core' 'mesa' 'gtk3' 'dbus' 'pango' 'gcc-libs' 'libxcb' 'libcups' 'libxext' 'libxfixes')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver//_/-}/${pkgname%-bin}_${pkgver//_/.}_amd64.deb")
sha256sums=('6b77898ed117e059ece4b055a125f3bc123db0e5acf3c23cb0dbf23ef8e1d2c6')
package() {
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}"
    rm -rf "${pkgdir}/usr/share/doc" "${pkgdir}/usr/share/lintian"
}
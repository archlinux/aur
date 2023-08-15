# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=spacemesh-bin
pkgver=1.0.16
pkgrel=1
pkgdesc="Spacemesh App (Smesher + Wallet)"
arch=('aarch64' 'x86_64')
url="https://spacemesh.io/"
_githuburl="https://github.com/spacemeshos/smapp"
_downloadurl="https://storage.googleapis.com/smapp"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('glib2' 'expat' 'libxcomposite' 'cairo' 'libdrm' 'libx11' 'mesa' 'libcups' 'alsa-lib' 'libxext' 'gtk3' 'pango' 'wayland' \
    'nspr' 'libxdamage' 'libxcb' 'gcc-libs' 'libxkbcommon' 'libxrandr' 'at-spi2-core' 'dbus' 'nss' 'libxfixes' 'ocl-icd' 'glibc' 'hicolor-icon-theme')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_downloadurl}/v${pkgver}/${pkgname%-bin}_app_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_downloadurl}/v${pkgver}/${pkgname%-bin}_app_${pkgver}_amd64.deb")
sha256sums_aarch64=('1884b4a3ec197a1cb0b2489feb36b82c996dfbd68c5e9faa4c5e31f3c8378ff6')
sha256sums_x86_64=('c2c1621483ac0f6242f14c2a4668265c01f3eb6f0f7b3c66c5df80d0db917287')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}
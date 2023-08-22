# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=spacemesh-bin
pkgver=1.1.1
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
sha256sums_aarch64=('879559fb78e79f491a4189196bd992d6ac625830c017d45d76aa81d91288c275')
sha256sums_x86_64=('6f7bafcfa3a3c2ec7fa1dc0b4a0b95d9d2fb8f5e2d21439d262a61b7b821775a')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}
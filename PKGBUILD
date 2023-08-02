# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="spacemesh-bin"
pkgver=1.0.10
pkgrel=1
pkgdesc="Spacemesh App (Smesher + Wallet)"
arch=('aarch64' 'x86_64')
url="https://spacemesh.io/"
_githuburl="https://github.com/spacemeshos/smapp"
_downloadurl="https://storage.googleapis.com/smapp"
license=('Apache')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('glib2' 'expat' 'libxcomposite' 'cairo' 'libdrm' 'libx11' 'mesa' 'libcups' 'alsa-lib' 'libxext' 'gtk3' 'pango' 'wayland' \
    'nspr' 'libxdamage' 'libxcb' 'gcc-libs' 'libxkbcommon' 'libxrandr' 'at-spi2-core' 'dbus' 'nss' 'libxfixes' 'ocl-icd' 'glibc' 'hicolor-icon-theme')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_downloadurl}/v${pkgver}/${pkgname%-bin}_app_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_downloadurl}/v${pkgver}/${pkgname%-bin}_app_${pkgver}_amd64.deb")
sha256sums_aarch64=('79c0d6fe58c787d39e358f88bc49c2412a2b6bda115c3a3393bd59bf81d6ed1f')
sha256sums_x86_64=('6d64fe780aad190a522875bab2e54d3bef9e6acc13ba19a10e23503be6d90264')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}
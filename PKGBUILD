# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=spacemesh-bin
pkgver=1.0.18
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
sha256sums_aarch64=('efbf43991fe6bbe85f626336f0d1df0393259100f0beb8048fd8ab1f781cb830')
sha256sums_x86_64=('09823a51ab6e3dbab310bd8639f4f9b5b76e4f261571f43fc4dd4afb9a98c0ba')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}
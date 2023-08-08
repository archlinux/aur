# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=spacemesh-bin
pkgver=1.0.12
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
sha256sums_aarch64=('e65cdf35bf1b6b4a351a5ec44bf6b88f7126f1629b15f460e1a4bc44b753592d')
sha256sums_x86_64=('ae0ed511d7bb4da785ec2c54234a5e34b02c0c0a42ee82b6693ff5b67daa60bb')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}
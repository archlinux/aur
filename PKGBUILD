# Maintainer: ariurn <admin@ariurn.com>

pkgname=happ-desktop-bin
pkgver=4.8.7
pkgrel=1
pkgdesc="Happ — user-friendly GUI client for xray-core with TUN/VPN and anti-censorship"
url="https://happ.su"
license=('custom:Proprietary')
provides=('happ' 'happ-desktop')
conflicts=('happ' 'happ-desktop')
install="${pkgname}.install"
options=('!strip')
noextract=("${pkgname}-${pkgver}-x86_64.pkg.tar.zst" "${pkgname}-${pkgver}-aarch64.pkg.tar.zst")

package() {
    tar -xf "${srcdir}/${pkgname}-${pkgver}-${CARCH}.pkg.tar.zst" -C "${pkgdir}" \
        --exclude='.PKGINFO' --exclude='.MTREE' --exclude='.INSTALL'
}




arch=('x86_64' 'aarch64')
_release_tag='4.8.7'
source_x86_64=("${pkgname}-${pkgver}-x86_64.pkg.tar.zst::https://github.com/Happ-proxy/happ-desktop/releases/download/${_release_tag}/Happ.linux.x64.pkg.tar.zst")
sha256sums_x86_64=('35796bdcea0b409dd0cf663b1a663a5e62ac7e152870261a7954beae23bddb39')
depends_x86_64=('glibc' 'openssl' 'libx11' 'libxkbcommon-x11' 'wayland' 'hicolor-icon-theme')
optdepends_x86_64=('polkit: privilege elevation for daemon operations')
source_aarch64=("${pkgname}-${pkgver}-aarch64.pkg.tar.zst::https://github.com/Happ-proxy/happ-desktop/releases/download/${_release_tag}/Happ.linux.arm64.pkg.tar.zst")
sha256sums_aarch64=('244b14b67b12df9e373a6cee08899c5226c5936947d8ca06b34343326b7c14dc')
depends_aarch64=('glibc' 'openssl' 'libx11' 'libxkbcommon-x11' 'wayland' 'hicolor-icon-theme')
optdepends_aarch64=('polkit: privilege elevation for daemon operations')

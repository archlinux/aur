# Maintainer: ariurn <admin@ariurn.com>

pkgname=happ-desktop-bin
pkgver=4.8.6
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
_release_tag='4.8.6'
source_x86_64=("${pkgname}-${pkgver}-x86_64.pkg.tar.zst::https://github.com/Happ-proxy/happ-desktop/releases/download/${_release_tag}/Happ.linux.x64.pkg.tar.zst")
sha256sums_x86_64=('d95e8d2339e8b67057c5f8a07319c8be122cafb41a3ee4dc7df3dc80fa5dc810')
depends_x86_64=('glibc' 'openssl' 'libx11' 'libxkbcommon-x11' 'wayland' 'hicolor-icon-theme')
optdepends_x86_64=('polkit: privilege elevation for daemon operations')
source_aarch64=("${pkgname}-${pkgver}-aarch64.pkg.tar.zst::https://github.com/Happ-proxy/happ-desktop/releases/download/${_release_tag}/Happ.linux.arm64.pkg.tar.zst")
sha256sums_aarch64=('965076059918044e443611276bf8a96ff64005e8a44cf40708875828ce0ddafe')
depends_aarch64=('glibc' 'openssl' 'libx11' 'libxkbcommon-x11' 'wayland' 'hicolor-icon-theme')
optdepends_aarch64=('polkit: privilege elevation for daemon operations')

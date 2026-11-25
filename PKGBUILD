# Maintainer: ariurn <admin@ariurn.com>

pkgname=happ-desktop-bin
pkgver=4.8.9
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
_release_tag='4.8.9'
source_x86_64=("${pkgname}-${pkgver}-x86_64.pkg.tar.zst::https://github.com/Happ-proxy/happ-desktop/releases/download/${_release_tag}/Happ.linux.x64.pkg.tar.zst")
sha256sums_x86_64=('6980b61393ca57c9182c3406636eee7f1051c4dab05aa929ae7eb4791922ef62')
depends_x86_64=('glibc' 'openssl' 'libx11' 'libxkbcommon-x11' 'wayland' 'hicolor-icon-theme')
optdepends_x86_64=('polkit: privilege elevation for daemon operations')
source_aarch64=("${pkgname}-${pkgver}-aarch64.pkg.tar.zst::https://github.com/Happ-proxy/happ-desktop/releases/download/${_release_tag}/Happ.linux.arm64.pkg.tar.zst")
sha256sums_aarch64=('ee5d981e8d64adea7be661d6cd1c62bce353390aae90cb2395e390da335d7374')
depends_aarch64=('glibc' 'openssl' 'libx11' 'libxkbcommon-x11' 'wayland' 'hicolor-icon-theme')
optdepends_aarch64=('polkit: privilege elevation for daemon operations')

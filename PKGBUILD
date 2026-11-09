# Maintainer: ariurn <admin@ariurn.com>

pkgname=happ-desktop-bin
pkgver=4.8.1
pkgrel=2
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
_release_tag='4.8.1'
source_x86_64=("${pkgname}-${pkgver}-x86_64.pkg.tar.zst::https://github.com/Happ-proxy/happ-desktop/releases/download/${_release_tag}/Happ.linux.x64.pkg.tar.zst")
sha256sums_x86_64=('8a5ab878587890fbd40d61ebfd127aca13662dd8eb1690625109deea292e9c43')
depends_x86_64=('glibc' 'openssl' 'libx11' 'libxkbcommon-x11' 'wayland' 'hicolor-icon-theme')
optdepends_x86_64=('polkit: privilege elevation for daemon operations')
source_aarch64=("${pkgname}-${pkgver}-aarch64.pkg.tar.zst::https://github.com/Happ-proxy/happ-desktop/releases/download/${_release_tag}/Happ.linux.arm64.pkg.tar.zst")
sha256sums_aarch64=('c50485cb3632fcf9f493f2f44a3e86878f1b47b3b1dd6f138172eff35708c9c6')
depends_aarch64=('glibc' 'openssl' 'libx11' 'libxkbcommon-x11' 'wayland' 'hicolor-icon-theme')
optdepends_aarch64=('polkit: privilege elevation for daemon operations')

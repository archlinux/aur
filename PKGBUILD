# Maintainer: ariurn <admin@ariurn.com>

pkgname=happ-desktop-bin
pkgver=4.5.3
pkgrel=1
pkgdesc="Happ — user-friendly GUI client for xray-core with TUN/VPN and anti-censorship"
arch=('x86_64')
url="https://happ.su"
license=('custom:Proprietary')
depends=('glibc' 'openssl' 'libx11' 'libxkbcommon-x11' 'wayland' 'hicolor-icon-theme')
optdepends=('polkit: privilege elevation for daemon operations')
provides=('happ' 'happ-desktop')
conflicts=('happ' 'happ-desktop')
install="${pkgname}.install"
options=('!strip')
_archpkg="Happ.linux.x64.pkg.tar.zst"
source=("${pkgname}-${pkgver}.pkg.tar.zst::https://github.com/Happ-proxy/happ-desktop/releases/download/${pkgver}/${_archpkg}")
sha256sums=('0a6d8b1886e5dc9d1ef93963fe9e5e7af9cae7f80f7b33ab016b71912a803a0c')
noextract=("${pkgname}-${pkgver}.pkg.tar.zst")

package() {
    tar -xf "${srcdir}/${pkgname}-${pkgver}.pkg.tar.zst" -C "${pkgdir}" \
        --exclude='.PKGINFO' --exclude='.MTREE' --exclude='.INSTALL'
}

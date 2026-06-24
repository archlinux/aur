# Maintainer: ariurn <admin@ariurn.com>

pkgname=happ-desktop-bin
pkgver=2.18.3
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
sha256sums=('7fcb4305bd5f7d549ee75d74c9d52083bd61f02c2263370f8f2aa33ea797980b')
noextract=("${pkgname}-${pkgver}.pkg.tar.zst")

package() {
    tar -xf "${srcdir}/${pkgname}-${pkgver}.pkg.tar.zst" -C "${pkgdir}" \
        --exclude='.PKGINFO' --exclude='.MTREE' --exclude='.INSTALL'
}

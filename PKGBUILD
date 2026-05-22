# Maintainer: ariurn <admin@ariurn.com>

pkgname=happ-desktop-bin
pkgver=2.16.2
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
sha256sums=('89bee4b2c4d00406342423c3c5f75dd27c3c966776cebd9380d9bd789c04ac76')
noextract=("${pkgname}-${pkgver}.pkg.tar.zst")

package() {
    tar -xf "${srcdir}/${pkgname}-${pkgver}.pkg.tar.zst" -C "${pkgdir}" \
        --exclude='.PKGINFO' --exclude='.MTREE' --exclude='.INSTALL'
}

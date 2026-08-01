# Maintainer: VelumVPN <jidos971@gmail.com>
pkgname=velumvpn-bin
pkgver=1.1.18
pkgrel=1
pkgdesc="VPN-клиент для обхода блокировок в России"
arch=('x86_64')
url="https://github.com/Jidos86/VelumVPN"
license=('custom')
depends=('libappindicator-gtk3' 'c-ares' 'http-parser')
provides=('velumvpn')
conflicts=('velumvpn')
options=('!strip')
install="${pkgname}.install"

source_x86_64=("${pkgname}-${pkgver}.pkg.tar.xz::https://github.com/Jidos86/VelumVPN/releases/download/${pkgver}/VelumVPN_x64.pkg.tar.xz")
sha256sums_x86_64=('SKIP')

package() {
  bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.pkg.tar.xz" \
    --exclude='.PKGINFO' \
    --exclude='.INSTALL' \
    --exclude='.MTREE' \
    --exclude='.BUILDINFO' \
    -C "${pkgdir}/"
}

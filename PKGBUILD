# Maintainer: Alois~ <aloisianer@proton.me>

pkgname=twingate
pkgver=2026.160.6555
pkgrel=1
pkgdesc="Zero trust remote access client for resource and networks, based on twingate-bin"
arch=('x86_64' 'aarch64')
license=(LicenseRef-Proprietary)
url="https://twingate.com"
depends=('systemd' 'cryptsetup' 'dbus')
install=$pkgname.install
noextract=(twingate-${pkgver}-${CARCH}.tar.zst)
source_x86_64=(twingate-${pkgver}-x86_64.tar.zst::https://binaries.twingate.com/client/linux/ARCH/x86_64/stable/twingate-amd64.pkg.tar.zst)
source_aarch64=(twingate-${pkgver}-aarch64.tar.zst::https://binaries.twingate.com/client/linux/ARCH/aarch64/stable/twingate-arm64.pkg.tar.zst)
sha256sums_x86_64=('5b3527bcbf247d7fdb295c7777512a4a01f0fa6f45d2220ffc78696e847dd808')
sha256sums_aarch64=('8691af99974878036395d6ea6e22bd8cdd2a57f1c8abf670e9bff5566f51d2ff')

package() {
    tar xf twingate-${pkgver}-${CARCH}.tar.zst \
        -C "$pkgdir" \
        --exclude ".MTREE" \
        --exclude ".INSTALL" \
        --exclude ".PKGINFO" \
        --exclude "var" \
        --exclude "run"
}

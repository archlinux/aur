# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Alois~ <aloisianer@proton.me>

pkgname=twingate
pkgver=2026.302.7126
pkgrel=1
pkgdesc="Zero trust remote access client for resource and networks, based on twingate-bin"
arch=(x86_64 aarch64)
license=(LicenseRef-Proprietary)
url="https://twingate.com"
depends=(systemd cryptsetup dbus)
install=$pkgname.install
noextract=(twingate-${pkgver}-${CARCH}.tar.zst)
source_x86_64=(twingate-${pkgver}-x86_64.tar.zst::https://binaries.twingate.com/client/linux/ARCH/x86_64/stable/twingate-amd64.pkg.tar.zst)
source_aarch64=(twingate-${pkgver}-aarch64.tar.zst::https://binaries.twingate.com/client/linux/ARCH/aarch64/stable/twingate-arm64.pkg.tar.zst)
sha256sums_x86_64=('910e593615c774805a017afa6439bc6cb73642123033884194dbbde2233ab44f')
sha256sums_aarch64=('d0d0e0e87616b3184833d9f8c8befa3e13b7fab3c6d7a35635d97e9bf81fc044')

package() {
    tar xf twingate-${pkgver}-${CARCH}.tar.zst \
        -C "$pkgdir" \
        --exclude ".MTREE" \
        --exclude ".INSTALL" \
        --exclude ".PKGINFO" \
        --exclude "var" \
        --exclude "run"
}

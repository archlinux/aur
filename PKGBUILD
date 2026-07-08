# Maintainer: Alois~ <aloisianer@proton.me>

pkgname=twingate
pkgver=2026.188.6692
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
sha256sums_x86_64=('f042b0c4edcb7a271ba40a309e3519afa334855826bdb1b1ba48f99f23b6d9a2')
sha256sums_aarch64=('170f7d2904b0fa5495d9f8bda341679928f68363ef7d47faac1131e25d0b549d')

package() {
    tar xf twingate-${pkgver}-${CARCH}.tar.zst \
        -C "$pkgdir" \
        --exclude ".MTREE" \
        --exclude ".INSTALL" \
        --exclude ".PKGINFO" \
        --exclude "var" \
        --exclude "run"
}

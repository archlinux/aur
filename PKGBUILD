# Maintainer: Alois~ <aloisianer@proton.me>

pkgname=twingate
pkgver=2026.239.6882
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
sha256sums_x86_64=('05eb46885776f8873f6a8e07fbca338d4526a547dcd6f67fa1f11749da5de996')
sha256sums_aarch64=('cb6f981787d33cd52c2a9bb6c23e0f24a651521569ac2aa221fe4c500ad5617d')

package() {
    tar xf twingate-${pkgver}-${CARCH}.tar.zst \
        -C "$pkgdir" \
        --exclude ".MTREE" \
        --exclude ".INSTALL" \
        --exclude ".PKGINFO" \
        --exclude "var" \
        --exclude "run"
}

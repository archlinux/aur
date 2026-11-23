# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Alois~ <aloisianer@proton.me>

pkgname=twingate
pkgver=2026.324.7275
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
sha256sums_x86_64=('d41b6e93a98791937aca1cda184ec050376960bfafadb89c21b7c7e0df536d87')
sha256sums_aarch64=('379a926c43f9f38c9b0e22c59ad0a57843b6f73d4d45113ffee85414dff641c1')

package() {
    tar xf twingate-${pkgver}-${CARCH}.tar.zst \
        -C "$pkgdir" \
        --exclude ".MTREE" \
        --exclude ".INSTALL" \
        --exclude ".PKGINFO" \
        --exclude "var" \
        --exclude "run"
}

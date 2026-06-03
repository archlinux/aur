# Maintainer: Alois~ <aloisianer@proton.me>

pkgname=twingate
pkgver=2026.140.6512
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
sha256sums_x86_64=('4d2acc7d61b0786efcc1f7a5cdd2996f8e558bbe351989b4b962b11da97a81db')
sha256sums_aarch64=('5f23d74088719769c00b52c3e13a66ad1b24db1787f50edec45d63e36b222f16')

package() {
    tar xf twingate-${pkgver}-${CARCH}.tar.zst -C "$pkgdir"
    cd "$pkgdir"
    rm .MTREE .INSTALL .PKGINFO
    rmdir -p var/lib/twingate run/twingate
}

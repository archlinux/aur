# Maintainer: sahdu sahduausds@foxmail.com
# Maintainer: sicalxy <sicalxy at outlook dot com>

pkgname=clash-party-bin
_pkgname=clash-party
pkgver=1.9.1
pkgrel=1
pkgdesc="A Clash client with party features"
arch=('x86_64' 'aarch64')
url="https://github.com/mihomo-party-org/clash-party"
license=('GPL')
depends=('gtk3' 'nss' 'libxss' 'libappindicator-gtk3' 'libnotify' 'libcups' 'libsecret' 'libxtst' 'alsa-lib')
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-${pkgver}-amd64.deb")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-${pkgver}-arm64.deb")
sha256sums_x86_64=('4828a0f90d983772db4e18a0d245c41ba0ffcb0cfb3afb0c7d63b435fe520ef3')
sha256sums_aarch64=('d42baffa7d245dcb613e4b2f5f31c04a35f3d34ca06cd01760c120e4f6013fee')

package() {
    bsdtar -xf data.tar.xz -C "$pkgdir/"

    chmod +x "$pkgdir/opt/clash-party/resources/sidecar/sysproxy.linux-x64-gnu.node"

    install -d -m755 "$pkgdir/usr/bin"
    ln -s "/opt/clash-party/mihomo-party" "$pkgdir/usr/bin/mihomo-party"
    ln -s "/opt/clash-party/mihomo-party" "$pkgdir/usr/bin/clash-party"
}

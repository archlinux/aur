# Maintainer: Christopher <archlinux-maintainer@christopherz.com>
# Contributor: Giancarlo Grasso <gianniesoft at gmail dot com>

pkgname=mysterium-vpn-desktop-bin
pkgver=10.14.4
pkgrel=1
pkgdesc="Mysterium VPN is a Desktop VPN client for Windows, macOS and Linux."
arch=('x86_64')
url="https://github.com/mysteriumnetwork/mysterium-vpn-desktop"
license=('MIT')
provides=('mysterium-vpn-desktop')
depends=('libxss'
         'nss'
         'libxtst'
         'libnotify'
         'libappindicator-gtk3'
         'openresolv'
         'gtk3'
         'xdg-utils'
         'at-spi2-core'
         'util-linux-libs'
         'libsecret')
source_x86_64=("https://github.com/mysteriumnetwork/mysterium-vpn-desktop/releases/download/${pkgver}/mysterium-vpn-desktop_${pkgver}_amd64.deb"
               "LICENSE")
sha256sums_x86_64=('33a8e3cc331fea5004ec9c6a13406f0f30520fb8cc10953edc782a362d0f783a'
                   '070d2f42e03987ec349cdb0f4c8668dda323ce30996c848703e70ae3944d3aa8')

package() {
  bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/MysteriumVPN/mysterium-vpn-desktop" "${pkgdir}/usr/bin"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

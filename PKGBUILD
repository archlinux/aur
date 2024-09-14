# Maintainer: Nym <ops@nymte.ch>
# Maintainer: Pierre Dommerc <pierre@nymtech.net>
# Maintainer: Lawrence Stalder <lawrence.stalder@pm.me>

pkgname=nymvpn-x-bin
pkgver=0.1.10
# upstream version
_pkgver=0.1.10
_release_tag=nym-vpn-x-v0.1.10
pkgrel=1
pkgdesc='NymVPN next desktop client'
arch=('x86_64')
url='https://github.com/nymtech/nym-vpn-client'
license=('GPL-3.0-only')
depends=('gcc-libs' 'bash' 'cairo' 'pango' 'gtk3' 'webkit2gtk' 'gdk-pixbuf2' 'glib2' 'openssl' 'libsoup')
makedepends=()
optdepends=('nym-vpnd: NymVPN daemon as a systemd service')
provides=('nymvpn-x')
conflicts=('nymvpn-x')
options=(!debug)
source=("$url/releases/download/$_release_tag/nymvpn-x_${_pkgver}_linux_x64"
    'nymvpn-x-wrapper.sh'
    'nymvpn-x.desktop'
    'nymvpn-x.svg')
sha256sums=(
    '7c599e94cbfb8fee2e36f43ff0895b95dba815823e97cc1eb043b9825e8d8f59' 
    'aa573dad7ada4d6d6aacfc58d50184ee6b67e9e919187c9a6ed0fd4ea9652106' 
    '8bf0dbd2a6c312630e1c2e866431d0361b24975ba17b4ab14c891efea326251c' 
    'c15b6028f25ea931c9bedf2b5600f91d6f94f15066afdbd7f789c770ea250e06')

package() {
  install -Dm755 "nymvpn-x_${_pkgver}_linux_x64" "$pkgdir/usr/bin/nymvpn-x"
  install -Dm755 "nymvpn-x-wrapper.sh" "$pkgdir/usr/bin/nymvpn-x-wrapper.sh"
  install -Dm644 "nymvpn-x.desktop"    "$pkgdir/usr/share/applications/nymvpn-x.desktop"
  install -Dm644 "nymvpn-x.svg"        "$pkgdir/usr/share/icons/nymvpn-x.svg"
}


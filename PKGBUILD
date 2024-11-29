# Maintainer: Nym <ops@nymte.ch>
# Maintainer: Pierre Dommerc <pierre@nymtech.net>
# Maintainer: Lawrence Stalder <lawrence.stalder@pm.me>

pkgname=nym-vpn-app-bin
pkgver=1.0.0
# upstream version
_pkgver=1.0.0
_release_tag=nym-vpn-app-v1.0.0
pkgrel=1
pkgdesc='NymVPN desktop client'
arch=('x86_64')
url='https://github.com/nymtech/nym-vpn-client'
license=('GPL-3.0-only')
depends=('gcc-libs' 'bash' 'cairo' 'gtk3' 'webkit2gtk-4.1' 'gdk-pixbuf2' 'glib2' 'openssl' 'libsoup3' 'nym-vpnd')
makedepends=()
provides=('nym-vpn-app')
conflicts=('nymvpn-x' 'nym-vpn-app')
options=(!debug)
source=("$url/releases/download/$_release_tag/nym-vpn_${_pkgver}_linux_x64"
    'nym-vpn.desktop'
    'nym-vpn.svg')
sha256sums=(
    '341263928f3020ca78fcfa617e8ac1b976b6b4b7550a234577437d56242df286' 
    '89d01a49dac087c987b2741dddb3bcb9e7f1461d9c0f50b7f75044ed45db575e' 
    'c15b6028f25ea931c9bedf2b5600f91d6f94f15066afdbd7f789c770ea250e06')

package() {
  install -Dm755 "nym-vpn_${_pkgver}_linux_x64" "$pkgdir/usr/bin/nym-vpn-app"
  install -Dm644 "nym-vpn.desktop" "$pkgdir/usr/share/applications/nym-vpn.desktop"
  install -Dm644 "nym-vpn.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/nym-vpn.svg"
}



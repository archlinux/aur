# Maintainer: Nym <ops@nymte.ch>
# Maintainer: Pierre Dommerc <pierre@nymtech.net>
# Maintainer: Lawrence Stalder <lawrence.stalder@pm.me>

pkgname=nym-vpn-app-bin
pkgver=0.2.3
# upstream version
_pkgver=0.2.3
_release_tag=nym-vpn-app-v0.2.3
pkgrel=3
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
    'nym-vpn-wrapper.sh'
    'nym-vpn.desktop'
    'nym-vpn.svg')
sha256sums=(
    'bfc302e582d086c691ac6038bc626ec94f7dae99eb8790ef66785a106a8f9a1c' 
    '963d0e778b1f2639e735bd4943ba617e4786d6ce973a8855f86824b6f15cdfa5' 
    'c1709d30f1756d0665d8763b8e70b6121d045c07e922f18a625e165c63faf583' 
    'c15b6028f25ea931c9bedf2b5600f91d6f94f15066afdbd7f789c770ea250e06')

package() {
  install -Dm755 "nym-vpn_${_pkgver}_linux_x64" "$pkgdir/usr/bin/nym-vpn-app"
  install -Dm755 "nym-vpn-wrapper.sh" "$pkgdir/usr/bin/nym-vpn-wrapper.sh"
  install -Dm644 "nym-vpn.desktop"    "$pkgdir/usr/share/applications/nym-vpn.desktop"
  install -Dm644 "nym-vpn.svg"        "$pkgdir/usr/share/icons/nym-vpn.svg"
}


# Maintainer: Nym <ops@nymte.ch>
# Maintainer: Pierre Dommerc <pierre@nymtech.net>
# Maintainer: Lawrence Stalder <lawrence.stalder@pm.me>

pkgname=nym-vpn-app-bin
pkgver=1.4.0
# upstream version
_pkgver=1.4.0
_release_tag=nym-vpn-app-v1.4.0
pkgrel=1
pkgdesc='NymVPN desktop client'
arch=('x86_64')
url='https://github.com/nymtech/nym-vpn-client'
license=('GPL-3.0-only')
depends=('gcc-libs' 'cairo' 'gtk3' 'webkit2gtk-4.1' 'gdk-pixbuf2' 'glib2' 'libsoup3' 'hicolor-icon-theme' 'nym-vpnd')
makedepends=()
provides=('nym-vpn-app')
conflicts=('nym-vpn-app')
options=(!debug)
source=("$url/releases/download/$_release_tag/nym-vpn_${_pkgver}_linux_x64"
    'nym-vpn.desktop'
    'nym-vpn.svg')
sha256sums=(
    '944e8caab6ebc164da84955b3438674d4622838eed6711e9a41a5d570fc6e516' 
    '89d01a49dac087c987b2741dddb3bcb9e7f1461d9c0f50b7f75044ed45db575e' 
    '8058039c52c588e38285971c4c37d50fdb8e05e50bbc19d7ffeb89d662a21f1e')

package() {
  install -Dm755 "nym-vpn_${_pkgver}_linux_x64" "$pkgdir/usr/bin/nym-vpn-app"
  install -Dm644 "nym-vpn.desktop" "$pkgdir/usr/share/applications/nym-vpn.desktop"
  install -Dm644 "nym-vpn.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/nym-vpn.svg"
}



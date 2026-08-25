# Maintainer: Nym Technologies SA <contact@nymtech.net>

pkgname=nym-vpn-app-bin
pkgver=2026.12.2
# upstream version
_pkgver=2026.12.2
_release_tag=nym-vpn-v2026.12.2
pkgrel=1
pkgdesc='NymVPN desktop client'
arch=('x86_64')
url='https://github.com/nymtech/nym-vpn-client'
license=('GPL-3.0-only')
depends=('gcc-libs' 'cairo' 'gtk3' 'webkit2gtk-4.1' 'gdk-pixbuf2' 'glib2' 'libsoup3' 'hicolor-icon-theme' 'libappindicator-gtk3' 'nym-vpnd')
makedepends=()
provides=('nym-vpn-app')
conflicts=('nym-vpn-app')
options=(!debug)
source=("$url/releases/download/$_release_tag/nym-vpn_${_pkgver}_linux_x64"
    'nym-vpn.desktop'
    'nym-vpn.svg')
sha256sums=(
    '4c67fdb7b47510d1761f13f26ced950633fcdee9c22b5226c919615351fa2244' 
    '143fd3eb05ccc8d714cda55c83221ffe6c5f83d85d5cce8407c188a8e72952d8' 
    '8058039c52c588e38285971c4c37d50fdb8e05e50bbc19d7ffeb89d662a21f1e')

package() {
  install -Dm755 "nym-vpn_${_pkgver}_linux_x64" "$pkgdir/usr/bin/nym-vpn-app"
  install -Dm644 "nym-vpn.desktop" "$pkgdir/usr/share/applications/nym-vpn.desktop"
  install -Dm644 "nym-vpn.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/nym-vpn.svg"
}



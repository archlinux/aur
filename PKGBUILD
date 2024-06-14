# Maintainer: Pierre Dommerc <pierre@nymtech.net>

pkgname=nymvpn-x-bin
pkgver=0.1.2_dev
pkgrel=1
pkgdesc='NymVPN next desktop client'
arch=('x86_64')
url='https://github.com/nymtech/nym-vpn-client'
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'bash' 'cairo' 'pango' 'gtk3' 'webkit2gtk' 'gdk-pixbuf2' 'glib2' 'openssl' 'libsoup')
makedepends=()
optdepends=('nym-vpnd: NymVPN daemon as a systemd service')
provides=('nymvpn-x')
conflicts=('nymvpn-x')
source=("$url/releases/download/0.1.2-pierre-test/nymvpn-x_0.1.2-dev_linux_x64"
    'nymvpn-x-wrapper.sh'
    'nymvpn-x.desktop'
    'nymvpn-x.svg')
sha256sums=('c9e5edb498b7349b9e5683b44696ad50098503777fb17a629866d6af1e2cde01'
    '4a68bccaa807684d2fd45832cd6df24f977e8d4e1c7a37de583c54423c21d259'
    '8bf0dbd2a6c312630e1c2e866431d0361b24975ba17b4ab14c891efea326251c'
    'c15b6028f25ea931c9bedf2b5600f91d6f94f15066afdbd7f789c770ea250e06')

package() {
  install -Dm755 "nymvpn-x_0.1.2-dev_linux_x64" "$pkgdir/usr/bin/nymvpn-x"
  install -Dm755 "nymvpn-x-wrapper.sh" "$pkgdir/usr/bin/nymvpn-x-wrapper.sh"
  install -Dm644 "nymvpn-x.desktop"    "$pkgdir/usr/share/applications/nymvpn-x.desktop"
  install -Dm644 "nymvpn-x.svg"        "$pkgdir/usr/share/icons/nymvpn-x.svg"
}


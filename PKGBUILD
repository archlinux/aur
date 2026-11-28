# Maintainer: Aleksandr Makunin <aleksandr@makunin.com>

pkgname=clod-clash-bin
pkgver=0.1.15
pkgrel=1
pkgdesc='Tauri desktop proxy client with the Mihomo core'
arch=('x86_64')
url='https://github.com/Mrvibecodic/clod-clash'
license=('GPL-3.0-only')
depends=('cairo' 'dbus' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3'
         'libayatana-appindicator' 'libgcc' 'libsoup3' 'webkit2gtk-4.1')
optdepends=('polkit: authorize TUN service management from the desktop')
provides=("clod-clash=$pkgver")
# The upstream binary ships shared Clash Verge helpers in /usr/bin.
conflicts=('clod-clash' 'clash-verge-bin' 'clash-verge-rev'
           'clash-verge-rev-bin' 'clash-verge-rev-autobuild-bin')
options=('!strip')
_deb="clod-clash-${pkgver}-amd64.deb"
source=("${_deb}::${url}/releases/download/clod-v${pkgver}/Clod.Clash_amd64.deb")
noextract=("${_deb}")
sha256sums=('7442d9b0b04be1526c3514dfadb72c90d5e4ad224545ee73391174d670f3072e')

package() {
  ar p "$srcdir/$_deb" data.tar.gz | bsdtar --no-same-owner -xzf - -C "$pkgdir"
}

# Maintainer: Harri Häivälä
#
# Template for the AUR package dj-usb-tkit-bin. scripts/aur-release.sh fills
# in 0.6.4, 1 and d43fc936847f04239f964662d4f5ea22adf4e1dab9cba724c2ec72214fa5980a and writes the result to the AUR clone;
# edit this file, not the PKGBUILD there.
#
# Repackages the release .deb. The binary links these libraries directly
# (readelf NEEDED), listed in full as namcap asks, glibc and libgcc included.

pkgname=dj-usb-tkit-bin
_appname=dj-usb-tkit
pkgver=0.6.4
pkgrel=1
pkgdesc="Local-first DJ library manager: export playlists to USB for Pioneer CDJ/XDJ, rekordbox and Engine DJ players, and repair broken USB drives"
arch=('x86_64')
url="https://github.com/haivala/dj-usb-tkit"
license=('AGPL-3.0-or-later')
depends=(
  'alsa-lib'
  'cairo'
  'dbus'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libgcc'
  'libsoup3'
  'webkit2gtk-4.1'
)
optdepends=('nodejs: Essentia analysis engine')
provides=("${_appname}")
conflicts=("${_appname}")
options=('!strip' '!debug')
source=("${_appname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/DJ_USB_Tkit_${pkgver}_amd64.deb")
sha256sums=('d43fc936847f04239f964662d4f5ea22adf4e1dab9cba724c2ec72214fa5980a')

package() {
  # makepkg has already unpacked the .deb into control/data tarballs.
  bsdtar -xf data.tar.* -C "${pkgdir}"
}

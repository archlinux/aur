# Maintainer: Harri Häivälä
#
# Template for the AUR package dj-usb-tkit-bin. scripts/aur-release.sh fills
# in 0.6.5, 1 and 4f9129f097f05cfec7483b32e409a54700057be4785b4758a94c2c696ceb0cb9 and writes the result to the AUR clone;
# edit this file, not the PKGBUILD there.
#
# Repackages the release .deb. The binary links these libraries directly
# (readelf NEEDED), listed in full as namcap asks, glibc and libgcc included.

pkgname=dj-usb-tkit-bin
_appname=dj-usb-tkit
pkgver=0.6.5
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
sha256sums=('4f9129f097f05cfec7483b32e409a54700057be4785b4758a94c2c696ceb0cb9')

package() {
  # makepkg has already unpacked the .deb into control/data tarballs.
  bsdtar -xf data.tar.* -C "${pkgdir}"
}

# Maintainer: Harri Häivälä
#
# Template for the AUR package dj-usb-tkit-bin. scripts/aur-release.sh fills
# in 0.6.2, 1 and dbf24e3858df807513c6efb3f9c51c626b601a87e38e8762d71cd04179d80be8 and writes the result to the AUR clone;
# edit this file, not the PKGBUILD there.
#
# Repackages the release .deb. The binary links these libraries directly
# (readelf NEEDED); glibc and libgcc are in base.

pkgname=dj-usb-tkit-bin
_appname=dj-usb-tkit
pkgver=0.6.2
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
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  'webkit2gtk-4.1'
)
optdepends=('nodejs: Essentia analysis engine')
provides=("${_appname}")
conflicts=("${_appname}")
options=('!strip' '!debug')
source=("${_appname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/DJ_USB_Tkit_${pkgver}_amd64.deb")
sha256sums=('dbf24e3858df807513c6efb3f9c51c626b601a87e38e8762d71cd04179d80be8')

package() {
  # makepkg has already unpacked the .deb into control/data tarballs.
  bsdtar -xf data.tar.* -C "${pkgdir}"
}

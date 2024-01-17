# Maintainer: Milk Brewster (milkii on freenode)
# Maintainer: David Marzal <mundolibre at tutanota dot com>

_pkgname=studio-controls
pkgname=${_pkgname}-git
pkgver=2.2.3.r0.g99a71a0
pkgrel=1
pkgdesc="An JACK audio setup utility with USB device and PulseAudio bridges."
arch=('x86_64')
url="https://github.com/ovenwerks/studio-controls"
license=('GPL-2.0-only')
groups=()
depends=('jack2' 'jack2-dbus' 'python' 'python-gobject' 'python-dbus' 'python-jack-client' 'python-pyalsaaudio' 'zita-ajbridge' 'a2jmidid')
makedepends=(git)
optdepends=('pulseaudio-jack: PulseAudio to JACK bridge'
            'alsa-utils: ALSA - Utilities (amixer)'
            'libffado: Driver for FireWire audio devices'
            'realtime-privileges: Realtime privileges for users'
            'carla: Audio Plugin Host'
            'pavucontrol: PulseAudio Volume Control'
            'qastools: qasmixer desktop mixer application'
            'agordejo: NSM based music production session manager'
            'raysession: NSM based music production session manager'
            'new-session-manager: NSM server and reference GUI'
            'zita-mu1: JACK app used to organise stereo monitoring')
provides=('studio-controls' 'studio-controls-git')
conflicts=('studio-controls' 'studio-controls-git' 'cadence')
replaces=()
backup=()
options=()
#install="${_pkgname}.install"
source=('git+https://github.com/ovenwerks/studio-controls')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname%}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/${_pkgname%}"
}

build() {
  cd "$srcdir/${_pkgname%}"
}

check() {
  cd "$srcdir/${_pkgname%}"
}

package() {
  cd "$srcdir/${_pkgname%}"
  cp -r etc usr $pkgdir
  mv $pkgdir/usr/sbin/studio-system $pkgdir/usr/bin
  rm -rf $pkgdir/usr/sbin
  # mv $pkgdir/lib $pkgdir/usr/lib
}

pkgname=plasma6-applets-eventcalendar
pkgver=1.0.4
pkgrel=1
pkgdesc="KDE Plasma 6 plasmoid for a calendar+agenda with weather that syncs to Google Calendar"
arch=('x86_64')
url="https://github.com/lenonk/plasma6-applet-eventcalendar"
license=('GPL')

depends=(
  'plasma-workspace'
  'libplasma'
  'plasma5support'
  'kirigami'
  'kcmutils'
  'ksvg'
  'qt6-base'
  'qt6-declarative'
  'qt6-5compat'
  'qt6-networkauth'
)

makedepends=(
  'cmake'
  'extra-cmake-modules'
  'gettext'
  'kpackage'
  'libplasma'
  'qt6-base'
  'qt6-networkauth'
)

optdepends=(
  'plasma-nm: network connectivity monitoring integration'
  'akonadi-calendar-tools: local Akonadi event create/edit support via konsolekalendar'
  'python-icalendar: iCal calendar source support'
  'python-gobject: notification helper script backend'
  'libnotify: desktop notifications for notification helper'
  'libcanberra: notification sound playback'
  'pipewire-audio: sound preview via pw-play'
  'libpulse: sound preview via paplay'
  'alsa-utils: sound preview via aplay'
  'ffmpeg: sound preview via ffplay'
)

source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cmake -B build -S "plasma6-applet-eventcalendar-$pkgver"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

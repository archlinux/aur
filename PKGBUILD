# Maintainer: Evert Vorster <superchief@evertvorster.com>

pkgname=dynamic-power-daemon
pkgver=4.1.6
pkgrel=1
pkgdesc="Auto-switches powerprofilesctl/asusctl profiles by CPU load & workload; with DBus control, per-user helpers and Qt tray UI"
arch=('any')
url="https://github.com/evertvorster/dynamic-power-daemon"
license=('GPL3')
depends=(
  'python'
  'python-yaml'
  'python-dbus'
  'python-dbus-next'
  'python-gobject'
  'python-psutil'
  'python-setproctitle'
  'python-systemd'
  'python-inotify-simple'   # AUR dependency providing inotify_simple module
  'python-pyqt6'
  'python-pyqtgraph'
)
optdepends=(
  'powerprofilesctl: profile switching backend'
  'asusctl: panel overdrive toggle on Asus laptops'
  'xorg-xrandr: refresh-rate switching under X11'
  'kscreen: refresh-rate switching under Wayland'
)
source=("https://github.com/evertvorster/dynamic-power-daemon/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

install="${pkgname}.install"

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # The root Makefile handles installation of all components
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}

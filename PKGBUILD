# Maintainer: Evert Vorster <superchief@evertvorster.com>

pkgname=dynamic-power-daemon
pkgver=4.5.7
pkgrel=1
pkgdesc="Auto-switches powerprofilesctl/asusctl profiles by CPU load & workload; with DBus control, per-user helpers and Qt tray UI"
arch=('any')
url="https://github.com/evertvorster/dynamic-power-daemon"
license=('GPL3')
depends=(
  'python'
  'python-dbus'
  'python-psutil'
  'python-pyqt6'
  'python-pyqtgraph'
  'python-pyyaml'
  'python-inotify-simple'
  'python-setproctitle'
  'python-dbus-next'
  'python-systemd'
  'kscreen'
  'qt6-base'
  'qt6-tools'
  'power-profiles-daemon'
  'kscreen'
)
optdepends=(
  'asusctl: panel overdrive toggle on Asus laptops'
)
source=("https://github.com/evertvorster/dynamic-power-daemon/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

install="${pkgname}.install"

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # The root Makefile handles installation of all components
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}

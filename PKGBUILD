# Maintainer: David Kolb <david.kolb@krinchan.com>

pkgname=nvidia-fake-powerd
pkgver=0.1.0
pkgrel=2
pkgdesc="dbus blackhole for nvidia.powerd.server for working around a bug in nvidia-495 drivers."
arch=('any')
url='https://forums.developer.nvidia.com/t/bug-nvidia-v495-29-05-driver-spamming-dbus-enabled-applications-with-invalid-messages/192892/9'
license=('GPL')
depends=(
  'dbus'
  'systemd'
)
install=nvidia-fake-powerd.install
changelog=ChangeLog
source=(
  'nvidia-fake-powerd.conf'
  'nvidia-fake-powerd.service'
)
sha256sums=(
  'ba38c83cec8fad091efec458e2bbcc4a886da6b66cece076374705064c23b63f'
  'f00f71c7de537a84210ef9d727e3ce140bb62adae33c27deec082aa7a6f8748e'
)

package() {
  install -Dm644 "${srcdir}/nvidia-fake-powerd.conf" "${pkgdir}/usr/share/dbus-1/system.d/nvidia-fake-powerd.conf"
  install -Dm644 "${srcdir}/nvidia-fake-powerd.service" "${pkgdir}/usr/lib/systemd/system/nvidia-fake-powerd.service"
}

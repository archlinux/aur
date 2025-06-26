pkgname=systemd-pilot
pkgver=3.0
pkgrel=1
pkgdesc="GTK desktop app to manage systemd services"
arch=('x86_64')
url="https://github.com/mfat/systemd-pilot"
license=('GPL3')
depends=('python-gobject' 'gtk4' 'libadwaita' 'python-paramiko' 'python-keyring' 'python-rich' 'python-pyyaml')
source=(
	"io.github.mfat.systemdpilot.png"
	"systemd-pilot.desktop"
	"git+https://github.com/mfat/systemd-pilot.git"
	)
md5sums=('SKIP' 'SKIP' 'SKIP')

prepare() {
  cd "$srcdir/systemd-pilot"
}

package() {
  cd "$srcdir/systemd-pilot"
  install -Dm755 src/main.py "$pkgdir/usr/bin/systemd-pilot"
  install -Dm644 io.github.mfat.systemdpilot.metainfo.xml "$pkgdir/usr/share/metainfo/io.github.mfat.systemdpilot.metainfo.xml"
  install -Dm644 "$srcdir/systemd-pilot.desktop" "$pkgdir/usr/share/applications/systemd-pilot.desktop"
  install -Dm644 "$srcdir/io.github.mfat.systemdpilot.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/io.github.mfat.systemdpilot.png"
}

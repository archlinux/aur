# Maintainer: Josh Dye <jpenguin@duck.com>
pkgbase=monitor-control
pkgname=('monitor-control-qt' 'monitor-control-tk')
pkgver=1.0
pkgrel=1
arch=('any')
url="https://github.com/tux-peng/Monitor-Control"
license=('MIT')
makedepends=('git')
source=("git+https://github.com/tux-peng/Monitor-Control.git")
sha256sums=('SKIP')

package_monitor-control-qt() {
  pkgdesc="PyQt6 GUI for ddcutil to control monitor brightness and contrast."
  depends=('ddcutil' 'i2c-tools' 'python-pyqt6')
  install=monitor-control.install

  cd "Monitor-Control"
  install -Dm755 monitor_control_qt.py "${pkgdir}/usr/bin/monitor-control-qt"
  install -Dm644 monitor_control.png "${pkgdir}/usr/share/pixmaps/monitor-control.png"
  install -Dm644 monitor-control-qt.desktop "${pkgdir}/usr/share/applications/monitor-control-qt.desktop"
}

package_monitor-control-tk() {
  pkgdesc="Lightweight Tkinter GUI for ddcutil to control monitor brightness."
  depends=('ddcutil' 'i2c-tools' 'python')
  install=monitor-control.install

  cd "Monitor-Control"
  install -Dm755 monitor_control_tk.py "${pkgdir}/usr/bin/monitor-control-tk"
  install -Dm644 monitor_control.png "${pkgdir}/usr/share/pixmaps/monitor-control.png"
  install -Dm644 monitor-control-tk.desktop "${pkgdir}/usr/share/applications/monitor-control-tk.desktop"
}

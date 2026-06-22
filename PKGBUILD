# Maintainer: Kanehekili <kanehekili.media@gmail.com>
pkgname=mediainfogui
pkgver=1.3.0
pkgrel=1
pkgdesc="GUI for MediaInfo data — Qt6, GTK3 and GTK4"
url="https://github.com/kanehekili/MediaInfoGui"
license=('GPL-2.0-or-later')
depends=('mediainfo')
optdepends=('python-pyqt6: Qt6 interface' 'python-gobject: GTK3/GTK4 interface' 'ffmpeg: MPEG-TS program info')
arch=('x86_64' 'aarch64')
source=(https://github.com/kanehekili/MediaInfoGui/releases/download/1.3.0/MediaInfoGui1.3.0.tar)
md5sums=(a715b1d5d2864c82bbe687d06a2e4ea8)

package() {
  cd "${srcdir}/MediaInfoGui"

  install -Dm 644 *.py            -t "${pkgdir}/opt/mediainfogui"
  install -Dm 755 MediaInfoGui.py -t "${pkgdir}/opt/mediainfogui"
  install -Dm 644 *.png           -t "${pkgdir}/opt/mediainfogui"

  install -Dm 644 *.desktop -t "${pkgdir}/usr/share/applications"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/mediainfogui/MediaInfoGui.py" "${pkgdir}/usr/bin/mediainfogui"
}

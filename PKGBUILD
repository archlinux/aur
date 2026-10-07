# Maintainer: Kanehekili <kanehekili.media@gmail.com>
pkgname=easyplayer
pkgver=1.6.0
pkgrel=1
pkgdesc="Simple video and audio player based on mpv"
url="https://github.com/kanehekili/EasyPlayer"
license=('GPL-2.0-or-later')
depends=('python-pyqt6' 'mpv' 'ffmpeg')
optdepends=('python-numpy: spectrum analyzer')
arch=('x86_64' 'aarch64')
source=(https://github.com/kanehekili/EasyPlayer/releases/download/1.6.0/easyplayer1.6.0.tar)
sha256sums=(dae13385a3170c0c5e460c4b381c4a89670c24ed70212c1fa4cc59336d76a1d6)

package() {
  cd "${srcdir}/easyplayer"

  install -Dm 644 *.py           -t "${pkgdir}/opt/easyplayer"
  install -Dm 755 EasyPlayer.py  -t "${pkgdir}/opt/easyplayer"
  find icons lib -type f \
    -exec install -Dm 644 "{}" "${pkgdir}/opt/easyplayer/{}" \;

  install -Dm 644 *.desktop -t "${pkgdir}/usr/share/applications"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/easyplayer/EasyPlayer.py" "${pkgdir}/usr/bin/easyplayer"
}

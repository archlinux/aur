# Maintainer: Kanehekili <kanehekili.media@gmail.com>
pkgname=audiocut
pkgver=1.0.1
pkgrel=1
pkgdesc="MP3/FLAC/WAV audio cutter"
url="https://github.com/kanehekili/AudioCut"
license=('GPL-2.0-or-later')
depends=('python-pyqt6' 'ffmpeg' 'python-numpy')
arch=('x86_64' 'aarch64')
source=(https://github.com/kanehekili/AudioCut/releases/download/V1.0.1/audiocut1.0.1.tar)
md5sums=(ffb9d225a9372a28a771211534aeb1ac)

package() {
  cd "${srcdir}/audiocut"

  install -Dm 644 *.py         -t "${pkgdir}/opt/audiocut"
  install -Dm 755 AudioCut.py  -t "${pkgdir}/opt/audiocut"
  find icons -type f \
    -exec install -Dm 644 "{}" "${pkgdir}/opt/audiocut/{}" \;

  install -Dm 644 *.desktop -t "${pkgdir}/usr/share/applications"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/audiocut/AudioCut.py" "${pkgdir}/usr/bin/audiocut"
}

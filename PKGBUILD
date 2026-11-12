# Maintainer: manupernas <120756979+manupernas@users.noreply.github.com>
pkgname=syn-iptv
pkgver=2.0.8
pkgrel=1
pkgdesc='GTK4 IPTV player with XMLTV EPG, FFmpeg DVR and Chromecast support'
arch=('any')
url='https://github.com/manupernas/SYN'
license=('MIT')
depends=(
  'python'
  'python-gobject'
  'python-cairo'
  'gtk4'
  'libadwaita'
  'mpv'
  'ffmpeg'
  'python-pychromecast'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/manupernas/SYN/archive/refs/tags/v${pkgver}.tar.gz")
# El script preparar_en_imac.sh sustituye SKIP por el SHA-256 real.
sha256sums=('cd26ee1a96941f2c22863c326a8abe35e9c37ce3fe5c7b64e0e69ceb5c670016')

package() {
  cd "${srcdir}/SYN-${pkgver}"
  bash packaging/stage-native.sh "${pkgdir}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

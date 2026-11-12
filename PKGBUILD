# Maintainer: manupernas <120756979+manupernas@users.noreply.github.com>
pkgname=syn-iptv
pkgver=2.0.9
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
sha256sums=('83649fed3364402c156a30885ca8a7e2ee70b4bb30d9d44a92a6acea75947b13')

package() {
  cd "${srcdir}/SYN-${pkgver}"
  bash packaging/stage-native.sh "${pkgdir}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

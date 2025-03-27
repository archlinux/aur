# Maintainer: Matthias Mailänder <matthias at mailaender dot name>
# Contributor: Anton Kudelin <kudelin at protonmail dot com>

pkgname=openchrom
pkgver=1.5.4
pkgrel=1
pkgdesc="Visualization and analysis of mass spectrometric and chromatographic data"
arch=("x86_64")
url="https://openchrom.net/"
license=('EPL')
# Don't build from source as there are no tagged releases and the marketplace is missing.
source=("https://products.lablicate.com/openchrom/${pkgver}/openchrom-lablicate_linux.x86_64_${pkgver}.tar.gz"
        "openchrom.desktop"
        "openchrom.png")
sha256sums=('e6e3f8893958df98472349fa90d564f251848267b3dfd718404d5d2522715a5a'
            'SKIP'
            'SKIP')
depends=('org.freedesktop.secrets' 'webkit2gtk')
options=(!strip)

package() {
  install -d "${pkgdir}/usr/lib/openchrom"
  cp -r configuration features p2 plugins readme artifacts.xml openchrom openchrom.ini "${pkgdir}/usr/lib/openchrom"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/openchrom/openchrom" "${pkgdir}/usr/bin/openchrom"

  install -Dm0644 "openchrom.desktop" "${pkgdir}/usr/share/applications/openchrom.desktop"
  install -Dm0644 "openchrom.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/openchrom.png"
}

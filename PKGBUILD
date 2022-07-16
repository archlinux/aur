# Maintainer: Anton Kudelin <kudelin at protonmail dot com>
# Maintainer: Matthias Mailänder <matthias at mailaender dot name>

pkgname=openchrom
pkgver=1.5.0
pkgrel=1
pkgdesc="Visualization and analysis of mass spectrometric and chromatographic data"
arch=("x86_64")
url="https://lablicate.com/platform/openchrom"
license=('EPL' 'custom: commercial')
# Don't build from source, because otherwise proprietary file converters are missing.
source=("https://products.lablicate.com/openchrom/${pkgver}/openchrom-lablicate_linux.x86_64_${pkgver}.tar.gz"
        "openchrom.desktop"
        "openchrom.png")
# Avoid checksums, because minor release overwrite without change in versioning.
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

package() {
  install -d "${pkgdir}/usr/lib/openchrom"
  cp -r configuration features p2 plugins readme artifacts.xml openchrom openchrom.ini "${pkgdir}/usr/lib/openchrom"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/openchrom/openchrom" "${pkgdir}/usr/bin/openchrom"

  install -Dm0644 "openchrom.desktop" "${pkgdir}/usr/share/applications/openchrom.desktop"
  install -Dm0644 "openchrom.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/openchrom.png"
}

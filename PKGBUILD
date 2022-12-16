# Maintainer: Matthias Mailänder <matthias at mailaender dot name>
# Contributor: Anton Kudelin <kudelin at protonmail dot com>

pkgname=openchrom
pkgver=1.5.0
pkgrel=1
pkgdesc="Visualization and analysis of mass spectrometric and chromatographic data"
arch=("x86_64")
url="https://openchrom.net/"
license=('EPL' 'custom: commercial')
# Don't build from source, because otherwise proprietary file converters are missing.
source=("https://products.lablicate.com/openchrom/${pkgver}/openchrom-lablicate_linux.x86_64_${pkgver}.tar.gz"
        "openchrom.desktop")
# Avoid checksums, because minor release overwrite without change in versioning.
sha256sums=('SKIP'
            'SKIP')

package() {
  install -d "${pkgdir}/usr/lib/openchrom"
  cp -r configuration features p2 plugins readme artifacts.xml openchrom openchrom.ini "${pkgdir}/usr/lib/openchrom"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/openchrom/openchrom" "${pkgdir}/usr/bin/openchrom"

  install -Dm0644 "openchrom.desktop" "${pkgdir}/usr/share/applications/openchrom.desktop"
  install -Dm0644 "icon.xpm" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/openchrom.xpm"
}

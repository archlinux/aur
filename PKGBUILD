# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ario-fonts
pkgver=2.0.1
pkgrel=1
pkgdesc="An English-Arabic font"
url="https://github.com/MohamadDarvishi/Ario/"
arch=('any')
license=('OFL')
provides=('ario' 'ario-fonts')
source=("https://github.com/MohamadDarvishi/Ario/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('82bd98404268441982a7b8a12778ee46236f0ce2fe347ae3a18b58e300b55276')

package() {
  cd "${srcdir}/Ario-${pkgver}"

  find Fonts -name '*.ttf' -exec install -Dm644 {} \
    -t "${pkgdir}/usr/share/fonts/TTF/" \;

  find Fonts -name '*.woff2' -exec install -Dm644 {} \
    -t "${pkgdir}/usr/share/fonts/woff2/" \;

  install -Dm644 README.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 CHANGELOG.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
  find Documentation -name '*.png' -exec install -Dm644 {} \
    -t "${pkgdir}/usr/share/doc/${pkgname}/documentation/" \;

  install -Dm644 OFL.txt \
    -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  find "Sources/Glyphs Format" -name '*.glyphs' -exec install -Dm644 {} \
    -t "${pkgdir}/usr/share/doc/${pkgname}/sources/" \;
}

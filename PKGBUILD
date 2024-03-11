# Maintainer: asm0dey <me@asm0dey.site>

pkgname=audiobookconverter-bin
pkgver=6.2.10
pkgrel=1
epoch=
pkgdesc="Improved AudioBookConverter based on freeipodsoftware release (mp3 to m4b converter)"
arch=("x86_64")
url="https://github.com/yermak/AudioBookConverter"
license=('GPL2')
groups=()
depends=()
provides=('audiobookconverter')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://github.com/yermak/AudioBookConverter/releases/download/version_${pkgver}/AudioBookConverter-static-binaries-${pkgver}.tar.gz"
        "audiobookconverter-AudioBookConverter.desktop")
sha512sums=('76171c2100a5c3919efe346c38b699c48637d6f85cac8074df674155e7ca85d1478a5dc52617a454b6a04c45a74cd3a51bb158ec48c972e0d80fea1e6161cde0'
            '6fafcfac49c8e7a0e2e0f2305f4812de6342a692f3a8cf7523f1d2decf49731e5ab60235ea4ecab5a9ea53c2a6463cff8fb08bc01a8ffd8b8f98f2bea80cfa6a')
package() {
  install -dm0755 "${pkgdir}/opt/"

  cp -r "${srcdir}/AudioBookConverter" "${pkgdir}/opt/audiobookconverter"

  install -dm0755 "${pkgdir}/usr/bin"
  ln -sf "/opt/audiobookconverter/bin/AudioBookConverter" "${pkgdir}/usr/bin/audiobookconverter"

  cp -dpr --no-preserve=ownership "${pkgdir}/opt/audiobookconverter/lib" "${pkgdir}/usr/lib"

  install -Dm644 "${srcdir}/audiobookconverter-AudioBookConverter.desktop" "${pkgdir}/usr/share/applications/audiobookconverter.desktop"
}

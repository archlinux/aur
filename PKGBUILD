# Maintainer: Jeff Youdontneedtoknow <jeffpublicjr at gmail dot com>

pkgname=gog-flatout
pkgver=1.0.0.7
pkgrel=2
pkgdesc="Thrilling combination of high-octane racing, smash-em-up demolition derby action and death defying stunts propelling the driver through the windshield!"
arch=("i686" "x86_64")
url="http://www.gog.com/game/flatout"
license=("custom")
groups=("games")
source=("local://gog_flatout_${pkgver}.tar.gz" "gog-flatout")
sha256sums=('54412a5920cce062125214ed0fce52fbcae058a97e90642cab8f11c5326b490f'
            'adc728b81188d3daeb7bca130dc591a73875a41e273488d0351534334a0ce3c5')
depends=(libgl libx11 libxext desktop-file-utils)
PKGEXT=.pkg.tar

package() {
  mkdir -p "${pkgdir}"/usr/share/gog/flatout
  cp -r "${srcdir}"/FlatOut/* "${pkgdir}"/usr/share/gog/flatout
  install -Dm644 "${srcdir}"/FlatOut/support/gog-flatout-primary.desktop "${pkgdir}"/usr/share/applications/gog-flatout.desktop
  install -Dm644 "${srcdir}"/FlatOut/support/gog-flatout.png "${pkgdir}"/usr/share/pixmaps/gog-flatout.png
  install -Dm644 "${srcdir}"/FlatOut/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}/gog-flatout" "${pkgdir}/usr/bin/gog-flatout"
}

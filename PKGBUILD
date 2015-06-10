# Maintainer : André Fettouhi <a.fettouhi@gmail.com>

pkgname=gog-lure-of-the-temptress
pkgver=1.0.0.4
pkgrel=1
pkgdesc="From the creators of the Broken Sword series, Revolution Software, comes the first in a series of 'Virtual Theater' adventure game."
arch=("i686" "x86_64")
url="http://www.gog.com/game/lure_of_the_temptress"
license=("custom")
groups=("games")
source=("local://gog_lure_of_the_temptress_${pkgver}.tar.gz" "gog-lure-of-the-temptress")
sha256sums=('5bce0b04cd3402c64ae50ca2f99c91c2cd3f5407f2afa5ffece7b672caedbea3'
            '892b9732d7fef04023ee88a5fb07f6ce630b9975cfb348489d0f11f786f5bde3')
depends=(freetype2 unionfs-fuse)
#options=('!strip')
PKGEXT=.pkg.tar

package() {
  mkdir -p "${pkgdir}"/opt/gog/lure-of-the-temptress
  cp -r "${srcdir}"/Lure\ of\ the\ Temptress/* "${pkgdir}"/opt/gog/lure-of-the-temptress
  install -Dm644 "${srcdir}"/Lure\ of\ the\ Temptress/support/gog-lure-of-the-temptress-primary.desktop "${pkgdir}"/usr/share/applications/gog-lure-of-the-temptress.desktop
  install -Dm644 "${srcdir}"/Lure\ of\ the\ Temptress/support/gog-lure-of-the-temptress.png "${pkgdir}"/usr/share/pixmaps/gog-lure-of-the-temptress.png
  install -Dm644 "${srcdir}"/Lure\ of\ the\ Temptress/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}/gog-lure-of-the-temptress" "${pkgdir}/usr/bin/gog-lure-of-the-temptress"
}

# Maintainer : André Fettouhi <a.fettouhi@gmail.com>

pkgname=gog-resonance
pkgver=1.0.0.1
pkgrel=1
pkgdesc="A particle physicist’s mysterious and spectacular death sparks a race to find his hidden vault and claim his terrifying new discovery."
arch=("i686" "x86_64")
url="http://www.gog.com/game/resonance"
license=("custom")
groups=("games")
source=("local://gog_resonance_${pkgver}.tar.gz" "gog-resonance")
sha256sums=('f7fafc948fe3bb996b06bf19bb94d51b55052f67a012a45648a8932119b352d9'
            '7077e75c7621aaae2b169593116be9e2567527fa10521f44c3534f5a4b1b5e08')
depends=(freetype2)
#options=('!strip')
PKGEXT=.pkg.tar

package() {
  mkdir -p "${pkgdir}"/opt/gog/resonance
  cp -r "${srcdir}"/Resonance/* "${pkgdir}"/opt/gog/resonance
  install -Dm644 "${srcdir}"/Resonance/support/gog-resonance-primary.desktop "${pkgdir}"/usr/share/applications/gog-resonance.desktop
  install -Dm644 "${srcdir}"/Resonance/support/gog-resonance.png "${pkgdir}"/usr/share/pixmaps/gog-resonance.png
  install -Dm644 "${srcdir}"/Resonance/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}/gog-resonance" "${pkgdir}/usr/bin/gog-resonance"
}

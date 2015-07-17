# Maintainer : André Fettouhi <a.fettouhi@gmail.com>

pkgname=gog-blackwell-convergence
pkgver=1.0.0.1
pkgrel=1
pkgdesc="Meet Rosangela Blackwell, an embittered writer who just found out that she is a medium and that it’s her mission."
arch=("i686" "x86_64")
url="http://www.gog.com/game/blackwell_bundle"
license=("custom")
groups=("games")
source=("local://gog_blackwell_convergence_${pkgver}.tar.gz" "gog-blackwell-convergence")
sha256sums=('0f6b907914f3212353416b3f188f746416d6e1fde5b0918e6561df40a59edb81'
            '74898834a9e5f0bb614173ac7333a1bc6cf535416c0fc4fb741ff78784aaf7b3')
depends=(freetype2)
#options=('!strip')
PKGEXT=.pkg.tar

package() {
  mkdir -p "${pkgdir}"/opt/gog/blackwell-convergence
  cp -r "${srcdir}"/Blackwell\ Convergence/* "${pkgdir}"/opt/gog/blackwell-convergence
  install -Dm644 "${srcdir}"/Blackwell\ Convergence/support/gog-blackwell-convergence-primary.desktop "${pkgdir}"/usr/share/applications/gog-blackwell-convergence.desktop
  install -Dm644 "${srcdir}"/Blackwell\ Convergence/support/gog-blackwell-convergence.png "${pkgdir}"/usr/share/pixmaps/gog-blackwell-convergence.png
  install -Dm644 "${srcdir}"/Blackwell\ Convergence/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}/gog-blackwell-convergence" "${pkgdir}/usr/bin/gog-blackwell-convergence"
}

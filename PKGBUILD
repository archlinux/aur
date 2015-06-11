# Maintainer : André Fettouhi <a.fettouhi@gmail.com>
# Contributors: SidK

pkgname=gog-sid-meier-s-colonization
pkgver=1.0.0.3
pkgrel=1
pkgdesc="a turn-based strategy game themed on the early European colonization of the New World"
arch=("i686" "x86_64")
url="http://www.gog.com/game/sid_meiers_colonization"
license=("custom")
source=("local://sid_meier_s_colonization_${pkgver}.tar.gz"
  "gog-sid-meier-s-colonization")
sha256sums=('e5924289e5a17a6938591e0e5d78a3ac0b1af6b8892ab63023f5b7c3fcbd610d'
            'aee047994508557aba9e5719f1ef5d5b652f3f56bd21d2d0faeed9064ecdfb42')
depends=(libpng12 unionfs-fuse)

package() {
  mkdir -p "${pkgdir}"/opt/gog/sid-meier-s-colonization
  cp -r "${srcdir}"/Sid\ Meiers\ Colonization/* "${pkgdir}"/opt/gog/sid-meier-s-colonization
  install -Dm644 "${srcdir}"/Sid\ Meiers\ Colonization/support/gog-sid-meier-s-colonization-primary.desktop "${pkgdir}"/usr/share/applications/gog-sid-meier-s-colonization.desktop
  install -Dm644 "${srcdir}"/Sid\ Meiers\ Colonization/support/gog-sid-meier-s-colonization.png "${pkgdir}"/usr/share/pixmaps/gog-sid-meier-s-colonization.png
  install -Dm644 "${srcdir}"/Sid\ Meiers\ Colonization/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}/gog-sid-meier-s-colonization" "${pkgdir}/usr/bin/gog-sid-meier-s-colonization"
}

PKGEXT=.pkg.tar 

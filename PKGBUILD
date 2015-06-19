# Maintainer : JoJos

pkgname=gog-apotheon
pkgver=1.0.0.1
pkgrel=1
pkgdesc="The Gods of Olympus have abandoned humanity, leaving you to perish without their benevolence. GOG linux game package required!"
arch=("i686" "x86_64")
url="http://www.gog.com/game/apotheon"
license=("custom")
groups=("games")
source=("local://gog_apotheon_${pkgver}.tar.gz" "gog-apotheon")
md5sums=('13432c627e378516474895eafab39ccb'
         '08eee547be3e5dc1f43c6937fca5bc6e')
depends=(libgl libx11 libxext desktop-file-utils)
#options=('!strip')
PKGEXT=.pkg.tar

package() {
  mkdir -p "${pkgdir}"/opt/gog/apotheon
  cp -r "${srcdir}"/Apotheon/* "${pkgdir}"/opt/gog/apotheon
  install -Dm644 "${srcdir}"/Apotheon/support/gog-apotheon-primary.desktop "${pkgdir}"/usr/share/applications/gog-apotheon.desktop
  install -Dm644 "${srcdir}"/Apotheon/support/gog-apotheon.png "${pkgdir}"/usr/share/pixmaps/gog-apotheon.png
  install -Dm644 "${srcdir}"/Apotheon/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}/gog-apotheon" "${pkgdir}/usr/bin/gog-apotheon"
}

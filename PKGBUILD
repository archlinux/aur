# Maintainer : André Fettouhi <a.fettouhi@gmail.com>

pkgname=gog-stargunner
pkgver=1.0.0.8
pkgrel=1
pkgdesc="This sci-fi scrolling shooter brings you some of the most intense action ever seen on the PC."
arch=("i686" "x86_64")
url="http://www.gog.com/game/stargunner"
license=("custom")
groups=("games")
source=("local://gog_stargunner_${pkgver}.tar.gz" "gog-stargunner")
sha256sums=('d04dd70b598fdd3b23e7d05fa1626feed08fd93d98511775dc33e2a537d69311'
            '692da4ad689edcad2f4e082ee40eb44cdbefb89adb1b61ea4e14f40c08910c4f')
depends=(libpng12 unionfs-fuse)
#options=('!strip')
PKGEXT=.pkg.tar 

package() {
  mkdir -p "${pkgdir}"/opt/gog/stargunner
  cp -r "${srcdir}"/Stargunner/* "${pkgdir}"/opt/gog/stargunner
  install -Dm644 "${srcdir}"/Stargunner/support/gog-stargunner-primary.desktop "${pkgdir}"/usr/share/applications/gog-stargunner.desktop
  install -Dm644 "${srcdir}"/Stargunner/support/gog-stargunner.png "${pkgdir}"/usr/share/pixmaps/gog-stargunner.png
  install -Dm644 "${srcdir}"/Stargunner/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}/gog-stargunner" "${pkgdir}/usr/bin/gog-stargunner"
}


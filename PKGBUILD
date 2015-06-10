# Maintainer : André Fettouhi <a.fettouhi@gmail.com>

pkgname=gog-silent-service-1
pkgver=1.0.0.6
pkgrel=1
pkgdesc="Prepare to dive into Silent Service, the submarine simulation that recreates authentic World War II sea patrols in the bloody waters of the South Pacific."
arch=("i686" "x86_64")
url="http://www.gog.com/game/silent_service_12"
license=("custom")
source=("local://gog_silent_service_1_${pkgver}.tar.gz"
  "gog-silent-service-1")
sha256sums=('ec42a0c160de7851d9da835a71cf43406459b4650785d44ef9b52a8e529b33f8'
            '6da31c2ed99247ae32d5fac2ccf664ade82660d4546a39df2d8f71ca4c38a496')
depends=(libpng12 unionfs-fuse)

package() {
  mkdir -p "${pkgdir}"/opt/gog/silent-service-1
  cp -r "${srcdir}"/Silent\ Service\ 1/* "${pkgdir}"/opt/gog/silent-service-1
  install -Dm644 "${srcdir}"/Silent\ Service\ 1/support/gog-silent-service-1-primary.desktop "${pkgdir}"/usr/share/applications/gog-silent-service-1.desktop
  install -Dm644 "${srcdir}"/Silent\ Service\ 1/support/gog-silent-service-1.png "${pkgdir}"/usr/share/pixmaps/gog-silent-service-1.png
  install -Dm644 "${srcdir}"/Silent\ Service\ 1/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}/gog-silent-service-1" "${pkgdir}/usr/bin/gog-silent-service-1"
}

PKGEXT=.pkg.tar 

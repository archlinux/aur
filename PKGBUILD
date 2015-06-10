# Maintainer : André Fettouhi <a.fettouhi@gmail.com>

pkgname=gog-silent-service-2
pkgver=1.0.0.6
pkgrel=1
pkgdesc="Prepare to dive into Silent Service, the submarine simulation that recreates authentic World War II sea patrols in the bloody waters of the South Pacific."
arch=("i686" "x86_64")
url="http://www.gog.com/game/silent_service_12"
license=("custom")
source=("local://gog_silent_service_2_${pkgver}.tar.gz"
  "gog-silent-service-2")
sha256sums=('2a56ff5dd1cb098480e9d377eba832de3615e0e53c5c2daed5caf8da5f8a2b6e'
            '96f929894670a1f8f6d407d69fda2416520663620e783edad42096ba5ac08a53')
depends=(libpng12 unionfs-fuse)

package() {
  mkdir -p "${pkgdir}"/opt/gog/silent-service-2
  cp -r "${srcdir}"/Silent\ Service\ 2/* "${pkgdir}"/opt/gog/silent-service-2
  install -Dm644 "${srcdir}"/Silent\ Service\ 2/support/gog-silent-service-2-primary.desktop "${pkgdir}"/usr/share/applications/gog-silent-service-2.desktop
  install -Dm644 "${srcdir}"/Silent\ Service\ 2/support/gog-silent-service-2.png "${pkgdir}"/usr/share/pixmaps/gog-silent-service-2.png
  install -Dm644 "${srcdir}"/Silent\ Service\ 2/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}/gog-silent-service-2" "${pkgdir}/usr/bin/gog-silent-service-2"
}

PKGEXT=.pkg.tar 

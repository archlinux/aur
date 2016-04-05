# Maintainer: Étienne Deparis <etienne [at] depar [dot] is>
# Creator: casimir <aur.casimir-lab.net>

pkgname=hubic
pkgver=2.1.0
_pkgbuildver=53
pkgrel=58
pkgdesc="Synchronization service provided by OVH."
arch=('any')
url="https://hubic.com/"
license=('custom')
provides=('hubic')
depends=('mono')
install=hubic.install
changelog=CHANGELOG
source=(http://mir7.ovh.net/ovh-applications/hubic/hubiC-Linux/${pkgver}/hubiC-Linux-${pkgver}.${_pkgbuildver}-linux.tar.gz)
sha1sums=('67c7a51325271945414f2c3c61eb371a908ea43b')

package() {
  cd "$pkgname"
  make PREFIX="$pkgdir/usr" RUNTIME_PREFIX="/usr" DBUSSERVICE_DIR="$pkgdir/usr/share/dbus-1/services" install
  install -dm 755 $pkgdir/usr/share/licenses/hubic
  mv $pkgdir/usr/share/doc/hubic/copyright $pkgdir/usr/share/licenses/hubic/LICENSE
  install -Dm 644 doc/Contrat_hubiC_2013.pdf $pkgdir/usr/share/licenses/hubic/CGU-fr_FR.pdf
}

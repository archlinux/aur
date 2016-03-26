# Maintainer: M0Rf30

pkgname=traccar
pkgver=3.4
pkgrel=1
[[ "$CARCH" == 'x86_64' ]] && arch=64
[[ "$CARCH" == 'i686' ]] && arch=32
_pkgver=linux-$arch-$pkgver
pkgdesc="Open source GPS tracking system"
arch=('i686' 'x86_64')
url="http://www.traccar.org/"
license=('APACHE')
depends=(java-runtime)
source=(http://prdownloads.sourceforge.net/$pkgname/$pkgname-${_pkgver}.zip
	"traccar.service")
md5sums=('81bc686e3390256f066b995a1f1950f0'
	 '0c5ebc020df4d1710c555b67e87e104f')
[[ "$CARCH" == 'x86_64' ]] && md5sums[0]='365561037ae7823a6f2f33420c166c8f'
 
package() {
  cd ${srcdir}
  ./traccar.run --noexec --target $pkgdir/opt/traccar/
  install -m755 -d "${pkgdir}/usr/lib/systemd/system"
  install -m644 "${srcdir}/traccar.service" "${pkgdir}/usr/lib/systemd/system/"
}



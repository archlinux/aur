# Maintainer: M0Rf30

pkgname=traccar
pkgver=2.10
pkgrel=2
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
md5sums=('0ea6fb9d40e32b32a4755e20490d5df6'
	 '0c5ebc020df4d1710c555b67e87e104f')
[[ "$CARCH" == 'x86_64' ]] && md5sums[0]='24f9492fa0b9c2cda91e4f8461386f36'
 
package() {
  cd ${srcdir}
  ./traccar.run --noexec --target $pkgdir/opt/traccar/
  install -m755 -d "${pkgdir}/usr/lib/systemd/system"
  install -m644 "${srcdir}/traccar.service" "${pkgdir}/usr/lib/systemd/system/"
}



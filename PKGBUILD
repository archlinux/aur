# Maintainer: M0Rf30

pkgname=traccar
pkgver=3.10
pkgrel=1
pkgdesc="Open source GPS tracking system"
arch=('i686' 'x86_64')
url="http://www.traccar.org/"
license=('APACHE')
depends=(java-runtime)
source=("https://github.com/tananaev/traccar/releases/download/v${pkgver}/$pkgname-linux-$pkgver.zip"
	"$pkgname.service") 

package() {
  cd ${srcdir}
  ./traccar.run --noexec --target $pkgdir/opt/traccar/
  install -m755 -d "${pkgdir}/usr/lib/systemd/system"
  install -m644 "${srcdir}/traccar.service" "${pkgdir}/usr/lib/systemd/system/"
}

md5sums=('ca1b307ee53d54d13f3ad593ff00209d'
         '0c5ebc020df4d1710c555b67e87e104f')

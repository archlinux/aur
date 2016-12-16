# Maintainer: M0Rf30

pkgname=traccar
pkgver=3.9
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

md5sums=('f354a68f964efcd841724a4eed56891a'
         '0c5ebc020df4d1710c555b67e87e104f')

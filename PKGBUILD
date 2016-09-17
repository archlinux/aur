# Maintainer: M0Rf30

pkgname=traccar
pkgver=3.7
pkgrel=1
pkgdesc="Open source GPS tracking system"
arch=('i686' 'x86_64')
url="http://www.traccar.org/"
license=('APACHE')
depends=(java-runtime)
source=("traccar.service")
source_i686=("https://github.com/tananaev/traccar/releases/download/v${pkgver}/$pkgname-linux-32-$pkgver.zip") 
source_x86_64=("https://github.com/tananaev/traccar/releases/download/v${pkgver}/$pkgname-linux-64-$pkgver.zip")

package() {
  cd ${srcdir}
  ./traccar.run --noexec --target $pkgdir/opt/traccar/
  install -m755 -d "${pkgdir}/usr/lib/systemd/system"
  install -m644 "${srcdir}/traccar.service" "${pkgdir}/usr/lib/systemd/system/"
}

md5sums=('0c5ebc020df4d1710c555b67e87e104f')
md5sums_i686=('eaf9e0d30e37cf5914211e9c79b608fa')
md5sums_x86_64=('0cb2583b705ecbc5ac1a343029181f9a')

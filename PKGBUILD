# Contributor: Xavier Benderitter <phenomenologeek at gmail.com>
pkgname=wmcpuload
pkgver=1.0.1
pkgrel=2
license=('GPL')
pkgdesc="A WindowMaker dockapp to monitor CPU usage"
url="http://linux.softpedia.com/get/System/Monitoring/WMCPULoad-18753.shtml"
arch=(i686 x86_64)
depends=('libxpm')
source=(https://launchpadlibrarian.net/19897668/wmcpuload_$pkgver.orig.tar.gz)
md5sums=('93a28a62d31d4b283edd78fffafb0835')
build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}


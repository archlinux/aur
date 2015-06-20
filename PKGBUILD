pkgname=libhdhomerun
pkgver=20150406
pkgrel=1
pkgdesc="Library for interfacing with HDHomeRun device"
arch=('any')
url="http://www.silicondust.com/downloads"
license=('LGPL')
source=("http://download.silicondust.com/hdhomerun/${pkgname}_${pkgver}.tgz")
md5sums=('6c765b35101681ed3c54695a1c6109c6')
depends=('glibc')

build() {
  cd "$srcdir/$pkgname"

  make
}

package() {
  cd "$srcdir/$pkgname"

  install -D -m 644 *.h -t $pkgdir/usr/include/libhdhomerun/
  install -D -m 755 libhdhomerun.so $pkgdir/usr/lib/libhdhomerun.so
  install -D -m 755 hdhomerun_config $pkgdir/usr/bin/hdhomerun_config
}

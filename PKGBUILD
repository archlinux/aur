# Maintener: Peter Karoly "Stone" JUHASZ <stone@midway.hu>
pkgname=rinetd
pkgver=0.73
pkgrel=8
pkgdesc="internet redirection server"
arch=('i686' 'x86_64')
url="https://github.com/samhocevar/rinetd/"
license=('GPL')
source=(https://github.com/samhocevar/rinetd/releases/download/v0.73/rinetd-0.73.tar.gz rinetd.service)
md5sums=('15f0196770dc1501c740b3b584c9732d'
         'af12522780774cabdb3c9797aa0b55ab')

build() {
  cd $srcdir/rinetd-0.73
  ./configure
  make
}

package() {
  install -d $pkgdir/usr/bin
  install -m 700 $srcdir/rinetd-0.73/rinetd $pkgdir/usr/bin/
  install -d $pkgdir/usr/share/man8
  install -m 644 $srcdir/rinetd-0.73/rinetd.8 $pkgdir/usr/share/man8/
  install -d $pkgdir/usr/lib/systemd/system
  install -m 644 $srcdir/rinetd.service $pkgdir/usr/lib/systemd/system/
  install -d $pkgdir/etc
  install -m 644 $srcdir/rinetd-0.73/rinetd.conf $pkgdir/etc/
}

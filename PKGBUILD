# Maintainer: Francesco Antonacci <punkeroso at gmail dot com> 

pkgname=dimdaemon
pkgver=0.5
pkgrel=2
pkgdesc="A simple and lightweight backlight-dimming daemon for laptops"
arch=(i686 x86_64)
license=('GPL3')
url="https://bbs.archlinux.org/viewtopic.php?pid=1028685"
groups=('daemons')
depends=('xorg-server' 'libconfig' 'libxext' 'libxss')
backup=('etc/conf.d/dimdaemon.conf')
install=$pkgname.install
source=(http://dl.dropbox.com/u/25456252/$pkgname-$pkgver.tar.gz)
md5sums=('17a3df5319c6d351dfaeef812c3c9584')

build() {
  cd $srcdir/$pkgname
  make
}

package() {
  cd $srcdir/$pkgname
  make
  install -D -m755 dimdaemon $pkgdir/usr/bin/dimdaemon
  install -D -m755 dimdaemond $pkgdir/etc/rc.d/dimdaemond
  install -D -m644 dimdaemon.conf $pkgdir/etc/conf.d/dimdaemon.conf
  install -D -m644 dimdaemon.service $pkgdir/usr/lib/systemd/system/dimdaemon.service
}

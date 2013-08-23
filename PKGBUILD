# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
pkgname=c2ctl
pkgver=090709
pkgrel=4
pkgdesc="Intel Core and Core 2 frequency and voltage modification utility"
arch=('i686' 'x86_64')
url="http://www.ztex.de/misc/c2ctl.e.html"
license=('GPL3')
# Other source: http://downloads.sourceforge.net/project/c2ctl/c2ctl/090709/c2ctl.tar.bz2
source=('http://www.ztex.de/misc/c2ctl.tar.bz2'
        'c2ctl.rc'
        'c2ctl.conf')
md5sums=('11612ad23e3211c7bd4fc4d735c1c71a'
         '7b6f14a939a67b193d152b5bc57f98f8'
         '8415fdd35e4269953f525686f28f7e1e')
install=c2ctl.install
backup=('etc/conf.d/c2ctl')

build() {
  cd $srcdir
  install -m755 -D c2ctl.rc $pkgdir/etc/rc.d/c2ctl
  install -m644 -D c2ctl.conf $pkgdir/etc/conf.d/c2ctl
  cd c2ctl
  install -m755 -D c2ctl $pkgdir/usr/bin/c2ctl
  install -m644 -D Readme $pkgdir/usr/share/doc/c2ctl/Readme.txt
}

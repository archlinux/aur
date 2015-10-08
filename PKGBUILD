# Maintainer: Ignat Loskutov <ignat.loskutov@gmail.com>
pkgbase='deadbeef-plugin-infobar-ng-hg'
_hgname='deadbeef-infobar-ng'
pkgname=('deadbeef-plugin-infobar-ng-gtk2-hg' 'deadbeef-plugin-infobar-ng-gtk3-hg')
pkgver=183
pkgrel=1
_pkgdesc="The Infobar-ng plugin for the DeaDBeeF audio player."
arch=('i686' 'x86_64')
url="https://bitbucket.org/IgnatLoskutov/deadbeef-infobar-ng"
license=(GPL2)
depends=('deadbeef>=0.6' 'libxml2')
makedepends=(mercurial)
source=('hg+https://bitbucket.org/IgnatLoskutov/deadbeef-infobar-ng')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_hgname
  hg id -n
}

build() {
  cd $srcdir/$_hgname
  make
}

package_deadbeef-plugin-infobar-ng-gtk2-hg() {
  pkgdesc=$_pkgdesc' The GTK2 version.'
  install -D -m644 $srcdir/$_hgname/gtk2/ddb_infobar_gtk2.so $pkgdir/usr/lib/deadbeef/ddb_infobar_gtk2.so
}

package_deadbeef-plugin-infobar-ng-gtk3-hg() {
  pkgdesc=$_pkgdesc' The GTK3 version.'
  install -D -m644 $srcdir/$_hgname/gtk3/ddb_infobar_gtk3.so $pkgdir/usr/lib/deadbeef/ddb_infobar_gtk3.so
}

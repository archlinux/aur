# Contributor: Joseph Riches

pkgname=xf86-input-cmt-setup
pkgdesc="A script to install the correct device specific conf files for the xf86-input-cmt driver"
pkgver=1
pkgrel=3
arch=(any)
url="https://github.com/joebonrichie/xf86-input-cmt-conf"
_gitname=("xf86-input-cmt-conf")
license=('GPLv3')
provides=("xf86-input-cmt=$pkgver")
install=${pkgname}.install
depends=('dmidecode')
makedepends=('git')

source=("$_gitname::git+https://github.com/joebonrichie/xf86-input-cmt-conf.git#commit=ab34935")
md5sums=('SKIP')

package() { 
  cd "$srcdir/$_gitname"
  mkdir -p $pkgdir/usr/bin/
  mv cmt-conf-setup.sh cmt-conf-setup
  cp cmt-conf-setup $pkgdir/usr/bin/cmt-conf-setup
}

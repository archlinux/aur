# Submitter: Joseph Riches

pkgname=xf86-input-cmt-setup
pkgdesc="A script to install the correct device specific conf files for the xf86-input-cmt driver"
pkgver=1
pkgrel=1
arch=(any)
url="https://github.com/joebonrichie/xf86-input-cmt-conf"
_gitname=("xf86-input-cmt-conf")
license=('GPLv3')
provides=("xf86-input-cmt=$pkgver")
install=${pkgname}.install
depends=('dmidecode')
makedepends=('git')

source=("$_gitname::git+https://github.com/joebonrichie/xf86-input-cmt-conf.git")
md5sums=('SKIP')

package() { 
  cd "$srcdir/$_gitname"
  mkdir -p $pkgdir/usr/bin/
  mv cmt-post-install.sh cmt-post-install
  cp cmt-post-install $pkgdir/usr/bin/cmt-post-install
}

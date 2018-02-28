# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=openbsd-manpages
pkgver=6.2
pkgrel=1
pkgdesc="The OpenBSD manual pages."
arch=('x86_64')
url="https://man.openbsd.org/"
license=('BSD')
source=("https://ftp.openbsd.org/pub/OpenBSD/${pkgver}/amd64/man62.tgz")
sha256sums=('7e47ac7364ffad253ba7b3e759e7e4e8f16da58d7f320eb0b47f09c3e647f408')

prepare() {
  cd ./usr/share/man
  msg2 'Renaming man pages for consistency with linux man pages.'	
  find . -type f -exec mv '{}' '{}openbsd' \;
}

package() {
  cd ./usr/share/man
  install -d $pkgdir/usr/share/man
  cp -a ./man* $pkgdir/usr/share/man/
}
# vim:set ts=2 sw=2 et:

# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Jesús Castro <51v4n@openmailbox.org>
pkgname=freebsd-man-pages
pkgver=11.2
pkgrel=1
pkgdesc="The FreeBSD manual pages."
arch=('x86_64')
url="https://www.freebsd.org/cgi/man.cgi"
license=('BSD')
provides=('freebsd-manpages')
conflicts=('freebsd-manpages')
source=("http://ftp.freebsd.org/pub/FreeBSD/releases/amd64/amd64/$pkgver-RELEASE/base.txz")
sha256sums=('a002be690462ad4f5f2ada6d01784836946894ed9449de6289b3e67d8496fd19')

prepare() {
  cd ./usr/share/man
  msg2 'Renaming man pages for consistency with linux man pages.'	
  find . -iname "*.gz" -exec rename .gz freebsd.gz '{}' \;
}

package() {
  cd ./usr/share/man
  install -d $pkgdir/usr/share/man
  cp -a ./man{1..9} $pkgdir/usr/share/man/
}
# vim:set ts=2 sw=2 et:

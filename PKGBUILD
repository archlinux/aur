# $Id: PKGBUILD,v 1.3 2006/05/22 18:57:55 uid1014 Exp $
# Maintainer: J. W. Birdsong  <jwbirdsong AT gmail DOT com>
# Contributor: eric <eric@archlinux.org>
#

pkgname=i8krellm
pkgver=2.5
pkgrel=2
pkgdesc="GKrellM plugin for Dell Inspiron/Latitude notebooks"
arch=(i686 x86_64)
url="http://www.coding-zone.com/?page=i8krellm"
license=('GPL')
depends=('i8kutils' 'gkrellm' 'gtk2')
source=(ftp://ftp.uni-kl.de/pub/linux/gentoo/distfiles/$pkgname-$pkgver.tar.gz)
md5sums=('adf099b85ca7b6f13ad17ee1a3be2cdb')

package() {
  cd $srcdir/$pkgname-$pkgver
  make
  # no configure script, and Makefile has /usr hardcoded
  install -D -m644 i8krellm.so \
			$pkgdir/usr/lib/gkrellm2/plugins/i8krellm.so
}

# vim:set ts=2 sw=2 et:


# $Id: PKGBUILD,v 1.10 2008/03/27 05:31:11 aaron Exp $
# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Contributor: Link Dupont <link@subpop.net>

pkgname=leafpad
pkgver=0.8.14
pkgrel=1
pkgdesc="A notepad clone for GTK+ 2.0"
arch=(i686 x86_64)
url="http://tarot.freeshell.org/leafpad/"
license=('GPL')
depends=(gtk2)
makedepends=(perlxml)
source=(http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('5f2abed8c880886e8aeb7e1a8d302e4c')

build()
{
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr --enable-chooser || return 1
	make || return 1
	make DESTDIR=$startdir/pkg install || return 1
}

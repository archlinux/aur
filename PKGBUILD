# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Contributor: Link Dupont <link@subpop.net>

pkgname=leafpad
pkgver=0.8.15
pkgrel=1
pkgdesc="A notepad clone for GTK+ 2.0"
arch=(i686 x86_64)
url="http://tarot.freeshell.org/leafpad/"
license=('GPL')
depends=(gtk2)
makedepends=(perlxml)
source=(http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz)

build()
{
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr --enable-chooser || return 1
	make || return 1
	make DESTDIR=$startdir/pkg install || return 1
}

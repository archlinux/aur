# Maintainer: Michał Górny <zrchos+arch@gmail.com>
# Contributor: Piotr Beling <qwak@stud.ics.p.lodz.pl>
pkgname=man-pages-pl
pkgver=0.6
pkgrel=2
pkgdesc='A collection of Polish translations of Linux manual pages'
arch=('any')
license=('BSD' 'GPL' 'LGPL' 'MIT')
url='http://sourceforge.net/projects/manpages-pl/'
depends=('man-db')
makedepends=('sed')
source=(http://downloads.sourceforge.net/project/manpages-pl/manpages-pl-${pkgver}.tar.bz2)
md5sums=('b3b16acf9de5c6d75bbf9c788bf5cf6a')

package() {
	cd $srcdir/manpages-pl-$pkgver

	# groups.1 is provided by shadow package in Arch
	rm generated/man1/groups.1

	make DESTDIR=$pkgdir install
}

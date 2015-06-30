# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=archivemail
pkgver=0.9.0
pkgrel=3
pkgdesc='A tool for archiving and compressing old email in mailboxes'
arch=('any')
url='http://archivemail.sourceforge.net/'
license=('GPL')
depends=('python2')
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('ee36b3e8451ec563ae9338f3dd75e3f6')

package() {
	cd $srcdir/$pkgname-$pkgver
	for f in setup.py test_archivemail archivemail; do
		sed 's#/usr/bin/env python#/usr/bin/env python2#g' -i $f
	done

	python2 setup.py install --root=$pkgdir
}

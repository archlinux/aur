# Maintainer: Denis Kobozev <d.v.kobozev at gmail dot com>

pkgname=xapian-omega
pkgver=1.2.0
pkgrel=1
pkgdesc="Indexers and CGI search frontend for Xapian"
arch=('i686' 'x86_64')
url="http://www.xapian.org/"
license=('GPL')
depends=('xapian-core' 'perl' 'pcre')
source=(http://oligarchy.co.uk/xapian/${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('4ab93bd80e786f2adbba1b49d61c5ee0')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	./configure --prefix=/usr --sysconfdir=/etc || return 1
	make || return 1
	make DESTDIR=${pkgdir} install || return 1
}

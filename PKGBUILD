# Maintainer: Pavol Hluchy (Lopo) <lopo at losys dot eu>

pkgname=ripole
pkgver=0.2.0
pkgrel=1
pkgdesc="ripOLE is a small program/library designed to pull out attachments from OLE2 data files (ie, MS Office documents)"
license=('BSD')
arch=('i686' 'x86_64')
url="http://www.pldaniels.com/ripole"
source=("http://www.pldaniels.com/ripole/$pkgname-$pkgver.tar.gz")
sha512sums=('63894ed5ac9f8f5c2fa74d4ac722da379ee6ea4970f70e2d6747c021956bc0ea20bb305f219dc088014c5fd3044e1da6d71704127907721f7e8e2631f135c8c9')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	make clean || return 1
	make || return 1
	}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -D -m 755 ripole ${pkgdir}/usr/bin/ripole
	}

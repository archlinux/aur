# Maintainer: David Raymond <raymond at kestrel dot nmt dot edu>
pkgname=foomatic-filters-lprng
pkgver=4.0.17
pkgrel=1
pkgdesc="Universal print filter, lprng version"
arch=('i686' 'x86_64')
url="http://www.linuxfoundation.org/collaborate/workgroups/openprinting/database/foomatic"
license=('GPL2')
depends=('libdbus')
optdepends=(
	'lprng: lprng printing system'
	'hplip: drivers for HP printers'
)
conflicts=(cups
)
source=(
	'http://www.openprinting.org/download/foomatic/foomatic-filters-4.0.17.tar.gz'
	README
)

build() {
	cd "$srcdir/foomatic-filters-$pkgver"
	./configure --prefix=/usr --sysconfdir='/etc' -mandir=/usr/share/man
	make
}

package() {
	  cd "$srcdir/foomatic-filters-$pkgver"
	  install -Dm655 foomatic-rip ${pkgdir}/usr/bin/foomatic-rip-lprng
	  install -Dm644 foomatic-rip.1 ${pkgdir}/usr/share/man/man1/foomatic-rip-lprng.1
}
md5sums=('b05f5dcbfe359f198eef3df5b283d896'
         '87ddcfc880342ff1f8414a2eda5d8b17')

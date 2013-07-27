# Maintainer: Maxwell Pray a.k.a. Synthead <synthead1@gmail.com>
# Contributor: Jens Pranaitis <jens@jenux.homelinux.org>
# Contributor: Michal Krenek <mikos@sg1.cz>

pkgname=samdump2
pkgver=3.0.0
pkgrel=2
pkgdesc='Dump password hashes from a Windows NT/2k/XP installation.'
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/ophcrack/files/samdump2/'
license='GPL'
depends=('openssl')
source=("http://downloads.sourceforge.net/ophcrack/$pkgname-$pkgver.tar.bz2")
md5sums=('5dac2dc3f8171a3dc86053d923a0e6f5')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make LIBS='-lssl -lcrypto' CFLAGS="$CFLAGS"
}

package() {
	install -Dm 755 "$srcdir/$pkgname-$pkgver/samdump2" "$pkgdir/usr/bin/samdump2"
	install -Dm 644 "$srcdir/$pkgname-$pkgver/samdump2.1" "$pkgdir/usr/share/man/man1/samdump2.1"
}

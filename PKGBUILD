# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=ircii
pkgver=20240918
pkgrel=1
pkgdesc='IRC and ICB client that runs under most UNIX platforms.'
arch=('i686' 'x86_64')
url='http://www.eterna.com.au/ircii/'
license=('BSD-Source-Code')
depends=('lftp' 'ncurses')
conflicts=('ircii-current')
source=("http://ircii.warped.com/$pkgname-$pkgver.tar.gz")
md5sums=('416e272af0413c5a10aceb251c9f2561')
sha1sums=('d2fbce73147d15e76aac1c248a1c6f7082173816')
sha256sums=('765e23edb58d6ccef0a0828424d75382d0dcab9feef06cca04d977c161e59f0c')
sha512sums=('6d43dee02bab655b8163d86349eb730e519c41beb5b85a14019e87b150ff6c8416bb2d71ad76f1169c190fa01c81c055a442437d31c0461459b119e7f798c0f3')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr --mandir=/usr/share/man
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" libexecdir="$pkgdir/usr/bin" mandir="$pkgdir/usr/share/man/man1" install
	install -D -m644 doc/Copyright $pkgdir/usr/share/licenses/$pkgname/COPYRIGHT
}

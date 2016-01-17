# Maintainer: Jack L. Frost <fbt@fleshless.org>
pkgname=scron
pkgver=0.4
pkgrel=2
pkgdesc="Suckless cron daemon"
arch=( 'i686' 'x86_64' )
url="http://git.2f30.org/scron/"
license=( 'MIT/X' )
makedepends=( 'git' )
provides=( 'cron' )
conflicts=( 'cron' )
backup=( 'etc/crontab' )
options=( 'strip' )
source=( "http://dl.2f30.org/releases/scron-${pkgver}.tar.gz" )

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm755 crond   "$pkgdir/usr/bin/crond"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README  "$pkgdir/usr/share/doc/$pkgname/README"
}

sha1sums=('da2d5b79ffb4a41a9dea817b409a582c3de290da')

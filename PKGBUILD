# Maintainer: Jack L. Frost <fbt@fleshless.org>
pkgname=scron
pkgver=0.4
pkgrel=1
pkgdesc="Suckless cron daemon"
arch=( 'i686' 'x86_64' )
url="http://git.2f30.org/scron/"
license=( 'MIT/X' )
makedepends=( 'git' )
provides=( 'cron' )
conflicts=( 'cron' )
backup=( 'etc/crontab' )
options=( 'strip' )
source=( "http://git.2f30.org/scron/snapshot/scron-${pkgver}.tar.gz" )
md5sums=('4b3c48d40246e462d193579f1b49c773')

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

# vim:set ts=2 sw=2 et:

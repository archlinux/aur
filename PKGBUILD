# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
pkgname=postgresql-tsearch-extras
pkgver=0.2
pkgrel=1
pkgdesc="Additional full text search functions for PostgreSQL"
arch=('i686' 'x86_64')
url="https://github.com/zulip/tsearch_extras"
license=('custom')
depends=('postgresql')
source=("https://github.com/zulip/tsearch_extras/archive/$pkgver.tar.gz")
md5sums=('80762b93d4b0d83af001a0743ae88a91')


build() {
  cd "$srcdir/tsearch_extras-$pkgver"

  make
}

package() {
  cd "$srcdir/tsearch_extras-$pkgver"

  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
}

# vim:set ts=2 sw=2 et:

# Maintainer: Fabius
# Contributor: Stefan Heinemann <stefan.heinemann@codedump.ch>

_gemname=pg_query
pkgname=ruby-pg-query
pkgver=1.1.0
pkgrel=2
pkgdesc="Ruby extension to parse, deparse and normalize SQL queries using the PostgreSQL query parser"
arch=(any)
url="https://github.com/lfittl/pg_query"
license=('BSD-3-CLAUSE')
makedepends=('rubygems')
depends=('ruby')
optdepends=()
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha256sums=("dc240116e0101950f0de9239b7d841d6b2ad4534b6f82a08755603d964f2111c")

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --no-user-install --ignore-dependencies -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
	install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

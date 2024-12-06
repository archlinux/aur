# Maintainer: Fabius
# Contributor: Stefan Heinemann <stefan.heinemann@codedump.ch>

_gemname=pg_query
pkgname=ruby-pg-query
pkgver=6.0.0
pkgrel=1
pkgdesc="Ruby extension to parse, deparse and normalize SQL queries using the PostgreSQL query parser"
arch=(any)
url="https://github.com/lfittl/pg_query"
license=('BSD-3-CLAUSE')
makedepends=('rubygems')
depends=('ruby' 'ruby-google-protobuf')
optdepends=()
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha256sums=("fbf09a4e900cee1d61e2bbfda1fefdbc35bc83c5f1c7ae1be1c6ffc5ae0f5c04")

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --no-user-install --ignore-dependencies -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
	install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

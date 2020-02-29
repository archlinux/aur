# Maintainer: Fabius
# Contributor: Stefan Heinemann <stefan.heinemann@codedump.ch>

_gemname=sqlint
pkgname=ruby-sqlint
pkgver=0.1.10
pkgrel=1
pkgdesc="Simple SQL linter supporting ANSI and PostgreSQL syntaxes"
arch=(any)
url="https://github.com/purcell/sqlint"
license=('MIT')
makedepends=('rubygems')
depends=('ruby' 'ruby-pg-query')
optdepends=()
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha256sums=("8c90b9fa00c1dfaa0d1e244fb7dc5c819aa163093e528b5473859c8895c64737")

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --no-user-install --ignore-dependencies -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
	install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

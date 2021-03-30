# Maintainer: Fabius
# Contributor: Stefan Heinemann <stefan.heinemann@codedump.ch>

_gemname=sqlint
pkgname=ruby-sqlint
pkgver=0.2.0
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
sha256sums=("73c2c4c190d1a06e51cca706fb38cf5cf7f0a3a9b9c2e19c9177939e986691fa")

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --no-user-install --ignore-dependencies -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
	install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

# Maintainer: Fabius
# Contributor: Stefan Heinemann <stefan.heinemann@codedump.ch>

_gemname=sqlint
pkgname=ruby-sqlint
pkgver=0.3.0
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
sha256sums=("369042b53e1e4b7f9acacacd244c841049e1cf0d59a6640ad27dbb05e597f419")

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --no-user-install --ignore-dependencies -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
	install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

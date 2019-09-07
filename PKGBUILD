# Maintainer: Fabius
# Contributor: Stefan Heinemann <stefan.heinemann@codedump.ch>

_gemname=sqlint
pkgname=sqlint
pkgver=0.1.9
pkgrel=2
pkgdesc="Simple SQL linter supporting ANSI and PostgreSQL syntaxes"
arch=(any)
url="https://github.com/purcell/sqlint"
license=('MIT')
makedepends=('rubygems')
depends=('ruby' 'ruby-pg-query')
optdepends=()
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha256sums=("7e5a28eac136c16546d9bae94955501b3f0e39d27422fc6be01588c20160e9dd")

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --no-user-install --ignore-dependencies -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
	install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

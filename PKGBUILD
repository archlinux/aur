# Maintainer: Fabius
# Contributor: Stefan Heinemann <stefan.heinemann@codedump.ch>

_pkgname=sqlint
pkgname=sqlint
pkgver=0.1.9
pkgrel=1
pkgdesc="Simple SQL linter supporting ANSI and PostgreSQL syntaxes"
arch=(any)
url="https://github.com/purcell/sqlint"
license=('MIT')
makedepends=("rubygems")
depends=("ruby-pg-query")
source=("https://rubygems.org/downloads/$_pkgname-$pkgver.gem")
noextract=("$_pkgname-$pkgver.gem")
sha256sums=("7e5a28eac136c16546d9bae94955501b3f0e39d27422fc6be01588c20160e9dd")


package() {
	local _gemdir="$(ruby -r rubygems -e"puts Gem.default_dir")"
	gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_pkgname-$pkgver.gem"
	install -D "$pkgdir$_gemdir/gems/$_pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

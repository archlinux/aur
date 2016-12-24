# Maintainer: Stefan Heinemann <stefan.heinemann@codedump.ch>

_pkgname=sqlint
pkgname=sqlint
pkgver=0.1.4
pkgrel=1
pkgdesc="SQLint is a simple command-line linter which reads your SQL files and reports any syntax errors or warnings it finds."
arch=("any")
url="https://github.com/purcell/sqlint"
license=("MIT")
depends=("ruby-pg-query")
makedepends=("rubygems")
source=("http://gems.rubyforge.org/gems/$_pkgname-$pkgver.gem")
noextract=("$_pkgname-$pkgver.gem")
sha256sums=("f573f6f6f25c3438c14e89d25848207d917dbb7d9d33f51842f33189b2a83a5d")


package() {
	local _gemdir="$(ruby -rubygems -e"puts Gem.default_dir")"
	gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_pkgname-$pkgver.gem"
	install -D "$pkgdir$_gemdir/gems/$_pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

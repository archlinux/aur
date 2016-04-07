# Maintainer: Stefan Heinemann <stefan.heinemann@codedump.ch>

_pkgname=sqlint
pkgname=sqlint
pkgver=0.1.3
pkgrel=1
pkgdesc="SQLint is a simple command-line linter which reads your SQL files and reports any syntax errors or warnings it finds."
arch=("any")
url="https://github.com/purcell/sqlint"
license=("MIT")
depends=()
makedepends=("rubygems")
source=("http://gems.rubyforge.org/gems/$_pkgname-$pkgver.gem")
noextract=("$_pkgname-$pkgver.gem")
sha256sums=("5572df1670e27ece87ee6397f790997b7ac142eeed7a31e18d2c4e05e2cb48e7")


package() {
	local _gemdir="$(ruby -rubygems -e"puts Gem.default_dir")"
	gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_pkgname-$pkgver.gem"
	install -D "$pkgdir$_gemdir/gems/$_pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: farwayer <farwayer@gmail.com>

_gemname=os
pkgname=ruby-$_gemname
pkgver=1.1.4
pkgrel=3
pkgdesc='Provides basic information about the operating system'
arch=('any')
url='https://rubygems.org/gems/os'
license=('MIT')
depends=('ruby')
source=(https://rubygems.org/downloads/"$_gemname-$pkgver".gem)
noextract=("$_gemname-$pkgver".gem)
sha256sums=('57816d6a334e7bd6aed048f4b0308226c5fb027433b67d90a9ab435f35108d3f')

package() {
	cd "$srcdir"
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver".gem
	install -Dm644 "$pkgdir$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

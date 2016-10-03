# Maintainer: Joel Goguen <contact+aur@jgoguen.ca>

_gemname=unicode-display_width
pkgname=ruby-${_gemname}
pkgver=1.1.1
pkgrel=1
pkgdesc="Determines the monospace display width of a string"
arch=('any')
depends=('ruby')
makedepends=('ruby-rspec')
url="https://rubygems.org/gems/${_gemname}"
noextract=($_gemname-$pkgver.gem)
license=('MIT')
source=(
	"https://rubygems.org/downloads/${_gemname}-${pkgver}.gem"
)
sha256sums=(
	'3f3ac133a3040c607f3fa1d61867d49c0ce341c6d96063c2deeeab23f55835ac'
)

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/MIT-LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

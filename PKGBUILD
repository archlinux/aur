# Maintainer: Charlie Wolf <charlie@wolf.is>

_gemname=foreman
pkgname=ruby-${_gemname}
pkgver=0.84.0
pkgrel=1
pkgdesc="Process manager for Procfile based applications"
arch=('any')
depends=('ruby' 'ruby-thor')
url="https://rubygems.org/gems/${_gemname}"
noextract=($_gemname-$pkgver.gem)
license=('MIT')
source=(
	"https://rubygems.org/downloads/${_gemname}-${pkgver}.gem"
)
sha256sums=(
	'806b1e86a9359d2e60d528e48ec05a965110514b4d414e7f5f27b07a691ab81a'
)

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

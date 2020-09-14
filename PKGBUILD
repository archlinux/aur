# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Maintainer: Charlie Wolf <charlie@wolf.is>

_gemname=foreman
pkgname=ruby-${_gemname}
pkgver=0.87.2
pkgrel=1
pkgdesc="Process manager for Procfile based applications"
arch=('any')
depends=('ruby')
url="https://rubygems.org/gems/${_gemname}"
noextract=($_gemname-$pkgver.gem)
license=('MIT')
source=(
	"https://rubygems.org/downloads/${_gemname}-${pkgver}.gem"
)
sha256sums=(
	'2727bc6e2100bf80b76e391aefe8c30a9d172b4a8acf56f072f94ffeedeeef6b'
)

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

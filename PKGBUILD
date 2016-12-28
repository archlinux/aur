# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=http_router
pkgname=ruby-$_gemname
pkgver=0.11.2
pkgrel=1
pkgdesc='This library allows you to recognize and build URLs in a Rack application.'
arch=(any)
url='https://github.com/joshbuddy/http_router'
license=(MIT)
depends=(ruby ruby-rack ruby-url_mount)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('bffe3cf2fa05191d47225d4901893cff2990e3c5d813ebfd388762a0905d2c5a')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}

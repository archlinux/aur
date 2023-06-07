# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Anatoly Bashmakov <anatoly at posteo dot net>
# Contributor: Matej Grabovsky <matej.grabovsky at gmail>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>

_gemname=sprockets
pkgname=ruby-$_gemname
pkgver=4.2.0
pkgrel=1
pkgdesc='Rack-based asset packaging system'
arch=(any)
url='https://github.com/rails/sprockets'
license=(MIT)
depends=(ruby-concurrent ruby-rack)
makedepends=(ruby-rdoc)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('5c273487255c47523f30c0b673310fce70a09ca060a6bbcd3e5d0d489e19024c')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" $_gemname-$pkgver.gem
  rm "$pkgdir$_gemdir/cache/$_gemname-$pkgver.gem"
}

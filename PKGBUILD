# Maintainer: farawayer <farwayer@gmail.com>

_gemname=security
pkgname=ruby-$_gemname
pkgver=0.1.3
pkgrel=3
pkgdesc='Security'
arch=(any)
url='http://mattt.me'
license=()
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('e2e0e2f843539b56f4f06b9fe7d9589e57ab3185')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

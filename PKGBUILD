# Maintainer: Sawyer Shepherd <contact@sawyershepherd.org>

_gemname=can_cli
pkgname=can
pkgver=0.1.2
pkgrel=1
pkgdesc='Command-line trash manager'
arch=(any)
url='https://github.com/sawshep/can'
license=(GPL-3.0)
depends=(ruby ruby-highline)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('6d3fd48ce8bcfb6e4e5293178d9b0feb155ae497')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

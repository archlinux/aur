# Maintainer: Sawyer Shepherd <contact@sawyershepherd.org>

_gemname=can_cli
pkgname=can
pkgver=0.1.8
pkgrel=1
pkgdesc='Command-line trash manager'
arch=(any)
url='https://github.com/sawshep/can'
license=(GPL3)
depends=(ruby ruby-highline)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('a99a9b4a132b5c4db28e880c1bbef82f1ec06a2512d0412e63cbbaf3fc6bdedd')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

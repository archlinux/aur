# Maintainer: farwayer <farwayer@gmail.com>

_gemname=tty-spinner
pkgname=ruby-$_gemname
pkgver=0.9.2
pkgrel=1
pkgdesc="A terminal spinner for tasks that have non-deterministic time frame."
arch=(any)
url='http://github.com/piotrmurach/tty-spinner'
license=(MIT)
depends=(
  ruby
  'ruby-tty-cursor>=0.7' 'ruby-tty-cursor<1'
)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('e5e9140ef4ea075dad1f0c6e41985c384b8931e2')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

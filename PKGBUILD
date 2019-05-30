# Maintainer: farwayer <farwayer@gmail.com>

_gemname=tty-spinner
pkgname=ruby-$_gemname
pkgver=0.9.1
pkgrel=1
pkgdesc="A terminal spinner for tasks that have non-deterministic time frame."
arch=('any')
url="http://github.com/piotrmurach/tty-spinner"
license=('MIT')
depends=(
  'ruby'
  'ruby-tty-cursor>=0.7' 'ruby-tty-cursor<1'
)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('b4848988b0a4799dd129d3b29c3f34f66ea91dfa')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" $_gemname-$pkgver.gem
  rm "$pkgdir$_gemdir/cache/$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:

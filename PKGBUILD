# Maintainer: farwayer <farwayer@gmail.com>

_gemname=tty-spinner
pkgname=ruby-$_gemname
pkgver=0.8.0
pkgrel=1
pkgdesc="A terminal spinner for tasks that have non-deterministic time frame."
arch=('any')
url="http://github.com/piotrmurach/tty-spinner"
license=('MIT')
depends=('ruby')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('2b469319e91b83962c1634d96d5289f6d4102fb4')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" $_gemname-$pkgver.gem
  rm "$pkgdir$_gemdir/cache/$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:

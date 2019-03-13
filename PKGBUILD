# Maintainer: farwayer <farwayer@gmail.com>

_gemname=httpclient
pkgname=ruby-$_gemname
pkgver=2.8.3
pkgrel=4
pkgdesc="Gives something like the functionality of libwww-perl (LWP) in Ruby."
arch=('any')
url="http://github.com/nahi/httpclient"
license=('Ruby')
depends=('ruby')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('531c6db0b5f371e3d029cbfb2f8d743f7eeb5c1b')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i \
    "$pkgdir$_gemdir" $_gemname-$pkgver.gem
  rm "$pkgdir$_gemdir/cache/$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:

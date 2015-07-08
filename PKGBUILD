# Maintainer: OmeGa <omega [U+0040] mailoo [.] org>

pkgname=ruby-httpclient
_gemname=httpclient
pkgver=2.6.0.1
pkgrel=1
pkgdesc="Gives something like the functionality of libwww-perl (LWP) in Ruby."
arch=('any')
url="http://github.com/nahi/httpclient"
license=('Ruby')
depends=('ruby')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('f6a18094e9d1154a9c90df90aa2c8518f3837863')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i \
    "$pkgdir$_gemdir" $_gemname-$pkgver.gem
}

# vim:set ts=2 sw=2 et:

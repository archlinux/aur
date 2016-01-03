# Maintainer: OmeGa <omega [U+0040] mailoo [.] org>

pkgname=ruby-httpclient
_gemname=httpclient
pkgver=2.7.1
pkgrel=1
pkgdesc="Gives something like the functionality of libwww-perl (LWP) in Ruby."
arch=('any')
url="http://github.com/nahi/httpclient"
license=('Ruby')
depends=('ruby')
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('5d0a605e42a7f591734c05c494b9b58aba162a5c')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i \
    "$pkgdir$_gemdir" $_gemname-$pkgver.gem
}

# vim:set ts=2 sw=2 et:

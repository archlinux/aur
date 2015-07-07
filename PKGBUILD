# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_gemname=oauth2-client
pkgname=ruby-$_gemname
pkgver=2.0.0
pkgrel=2
pkgdesc="Create quick and dirty OAuth2 clients."
arch=(any)
url="https://tiabas.github.io/oauth2-client/"
license=('MIT')
depends=('ruby' 'ruby-addressable' 'ruby-bcrypt-ruby')
makedepends=('rubygems')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('f1418e5d7589604cd630ce21861a31e67347903a9bf21021f8866b0eaa4cf799')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}

# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_gemname=yam
pkgname=ruby-$_gemname
pkgver=2.4.0
pkgrel=2
pkgdesc="A Ruby wrapper for accessing Yammer's REST API."
arch=(any)
url="https://github.com/yammer/yam"
license=('MIT')
depends=('ruby' 'ruby-addressable' 'ruby-multi_json' 'ruby-oauth2-client' 'ruby-oj'
	'ruby-rest-client')
makedepends=('rubygems')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('12861a971fc5d0f8da653b099f3e10ed45833b9aab175e6a89059ec9ac9c36f7')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}

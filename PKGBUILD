# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>
# Contributor: Christopher Eby <kreed at kreed dot org>

_gemname=choice
pkgname=ruby-$_gemname
pkgver=0.2.0
pkgrel=2
pkgdesc="Define and parse command line options with a friendly DSL."
arch=(any)
url="https://github.com/defunkt/choice"
license=('MIT')
depends=('ruby')
makedepends=('rubygems')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('a19617f7dfd4921b38a85d0616446620de685a113ec6d1ecc85bdb67bf38c974')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}

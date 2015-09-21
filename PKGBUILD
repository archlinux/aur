# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>
# Contributor: Artem Vorotnikov <artem at vorotnikov dot me>

_gemname=pry
pkgname=ruby-$_gemname
pkgver=0.10.1
pkgrel=3
pkgdesc='An IRB alternative and runtime developer console.'
arch=(any)
url='http://pryrepl.org'
license=(MIT)
depends=(ruby ruby-coderay ruby-slop-3 ruby-method_source)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('1f4925cdc8d83db67ba9b7ff542f042558c0ceb5579966e0fabc6d0eaa2b19c8')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}

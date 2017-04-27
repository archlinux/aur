# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=hanami
pkgname=ruby-$_gemname
pkgver=1.0.0
pkgrel=1
pkgdesc='A web framework for ruby.'
arch=(any)
url='http://hanamirb.org/'
license=(MIT)
depends=(ruby ruby-bundler ruby-concurrent-ruby ruby-hanami-assets ruby-hanami-controller ruby-hanami-helpers ruby-hanami-mailer ruby-hanami-router ruby-hanami-utils ruby-hanami-validations ruby-hanami-view ruby-thor)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('0ccb48d497a3da182d08ead6bc1c8ad61e468af80a720f52dbea5d8409e661da')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}

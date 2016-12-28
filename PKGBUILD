# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=hanami
pkgname=ruby-$_gemname
pkgver=0.9.2
pkgrel=1
pkgdesc='A web framework for ruby.'
arch=(any)
url='http://hanamirb.org/'
license=(MIT)
depends=(ruby ruby-bundler ruby-concurrent-ruby ruby-hanami-assets ruby-hanami-controller ruby-hanami-helpers ruby-hanami-mailer ruby-hanami-router ruby-hanami-utils ruby-hanami-validations ruby-hanami-view ruby-thor)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('79657ca889eec321879829f1588c70e10676ba0efbb8e2edd21f52276c5d0262')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}

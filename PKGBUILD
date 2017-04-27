# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=hanami-mailer
pkgname=ruby-$_gemname
pkgver=1.0.0
pkgrel=1
pkgdesc='Mail for Ruby applications and Hanami mailers.'
arch=(any)
url='http://hanamirb.org/'
license=(MIT)
depends=(ruby ruby-hanami-utils ruby-mail ruby-tilt)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('d3804db9464970866013547026bd2234ab1f278f835447fd71d5652f315674f1')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}

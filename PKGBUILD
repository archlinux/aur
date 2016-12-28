# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=hanami-mailer
pkgname=ruby-$_gemname
pkgver=0.4.0
pkgrel=1
pkgdesc='Mail for Ruby applications and Hanami mailers.'
arch=(any)
url='http://hanamirb.org/'
license=(MIT)
depends=(ruby ruby-hanami-utils ruby-mail ruby-tilt)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('94c2adb8ff1db6e5316d8ad0a16696c58e9522dbb652aa7d0d0155f187cc6fa0')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}

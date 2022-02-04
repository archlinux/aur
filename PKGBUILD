# Maintainer: Jameson Pugh <imntreal@gmail.com>

_gemname=sshkey
pkgname=ruby-$_gemname
pkgver=2.0.0
pkgrel=1
pkgdesc='SSH private and public key generator in pure Ruby'
arch=(any)
url='https://github.com/bensie/sshkey'
license=(MIT)
depends=('ruby')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('77d162e8bcd5d2a1833193c3ad7700b2c6994dad547c8e2341e4598d4bb1730d')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:

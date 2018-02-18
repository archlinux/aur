# Maintainer: Colin Arnott <colin@urandom.co.uk>

_gemname=unf_ext
pkgname=ruby-$_gemname
pkgver=0.0.7.5
pkgrel=1
pkgdesc="Unicode Normalization Form support library for CRuby"
arch=(any)
url="https://github.com/knu/ruby-unf_ext"
license=('MIT')
depends=('ruby')
makedepends=('rubygems' 'ruby-rdoc')
optdepends=('ruby-bundler' 'ruby-rake' 'ruby-rdoc' 'ruby-test-unit')
source=(https://rubygems.org/downloads/${pkgname#ruby-}-$pkgver.gem)
noextract=(${pkgname#ruby-}-$pkgver.gem)
sha512sums=('5d60740172034253fec9659bec49e60f639e93d8f147582e26a012712ec2e5fca30674efc52695def0c3cd145c5ddd93a56a6d0f854ab04e7fc81544e6aede16')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "${pkgname#ruby-}-$pkgver.gem"
  rm "$pkgdir/$_gemdir/cache/${pkgname#ruby-}-$pkgver.gem"
}

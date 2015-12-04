# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=logging
pkgname=ruby-$_gemname
pkgver=2.0.0
pkgrel=1
pkgdesc='Logging is a flexible logging library for use in Ruby programs'
arch=(any)
url='http://rubygems.org/gems/logging'
depends=('ruby' 'ruby-little-plugger>=1.1' 'ruby-multi_json>=1.10')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('cddd1a8fb083662c60ac06adfd3a1ddb3db19bd249ddddee7580a16c15f3c2886abb367113affd43c7dcb7fd9358fd334f812815a4fdf55b674ba086792d482e')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

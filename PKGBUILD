# Maintainer: Carsteb Feuls <archlinux@carstenfeuls.de>

_gemname=jekyll-coffeescript
pkgname=ruby-$_gemname
pkgver=1.0.1
pkgrel=2
pkgdesc='A CoffeeScript converter for Jekyll.'
arch=(any)
url='https://github.com/jekyll/jekyll-coffeescript'
license=('MIT')
depends=('ruby' 'ruby-coffee-script>2.2')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('5fbedb81117649c688e88a0862299f8d928376bc68cc75637f4743e322265601d56fe75778dcdba9eec22e41bc475a54fd09adc6e5d88525a005a0ecf07ea15e')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

# Maintainer: Carsteb Feuls <archlinux@carstenfeuls.de>

_gemname=jekyll-coffeescript
pkgname=ruby-$_gemname
pkgver=1.1.1
pkgrel=1
pkgdesc='A CoffeeScript converter for Jekyll.'
arch=(any)
url='https://github.com/jekyll/jekyll-coffeescript'
license=('MIT')
depends=('ruby' 'ruby-coffee-script>2.2' 'ruby-coffee-script-source>1.11.1')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('6e6f7c21b01a840c30b668b68da2d0ce657bbc6f6394502c32b93f0a2d8881ce50066dc1f8a34496101db24e97da3ea857ae02f8d983b2cbea90a104a4be8ccf')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

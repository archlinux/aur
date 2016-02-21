# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=coffee-script-source
pkgname=ruby-$_gemname
pkgver=1.10.0
pkgrel=1
pkgdesc='The CoffeeScript Compiler'
arch=('any')
url='http://jashkenas.github.com/coffee-script/'
license=('MIT')
depends=('ruby')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('09b8a25f185feac94e6d0226accdaf2bee207995a46ede77b6daa581afce7b5c2fc87acc4660d8467fae881d15b2c78c64bc5f1084b68a51ac287efe09a3b053')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

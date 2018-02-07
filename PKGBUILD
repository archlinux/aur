# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=coffee-script-source
pkgname=ruby-$_gemname
pkgver=1.12.2
pkgrel=1
pkgdesc='The CoffeeScript Compiler'
arch=('any')
url='http://jashkenas.github.com/coffee-script/'
license=('MIT')
depends=('ruby')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('f20dfc576202e5100f297e28481ac4e61776fd6684600ce5949b5deb26bfbacd74ae183462fc3cdaa81f95eb95729cd520b72841f70b6b4b133b1eea08ed6fcb')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

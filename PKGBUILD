# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=logging
pkgname=ruby-$_gemname
pkgver=2.2.2
pkgrel=1
pkgdesc='Logging is a flexible logging library for use in Ruby programs'
arch=(any)
url='https://github.com/TwP/logging/'
depends=('ruby' 'ruby-little-plugger>=1.1' 'ruby-multi_json>=1.10')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('9eeaec06f61dec5f79b7b656b77504026d6d91baea52594fa508f1587a8300ebb3d5c30461c7b4a41eb86f7b98530e4f6ab7853946fa14f00b84884be780b64a')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

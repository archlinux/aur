# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=less
pkgname=ruby-$_gemname
pkgver=2.6.0
pkgrel=1
pkgdesc='Leaner CSS, in your browser or Ruby (via less.js)'
arch=('any')
url='http://lesscss.org'
license=('Apache 2.0')
depends=('ruby' 'ruby-commonjs>=0.2.7')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('a92b007559d678b7196bda92a251906faac8d691a7debc111d6cfc783a83a955fb157ca69d078d2801ce0aa2352d55771b6a4e804325ca7c73407fbcb31592f3')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

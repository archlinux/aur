# Maintainer: Anatoly Bashmakov <anatoly at posteo dot net>

_gemname=ruby2_keywords
pkgname=ruby-$_gemname
pkgver=0.0.4
pkgrel=1
pkgdesc='Shim library for Module#ruby2_keywords'
arch=(any)
url='https://github.com/ruby/ruby2_keywords'
license=(RUBY)
depends=(ruby)
makedepends=(ruby-rdoc)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('0637984a6ee09fccc6397c0d3becb9ad690524a7')

package() {
  local _gemdir="$(ruby -e 'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

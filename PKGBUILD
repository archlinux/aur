# Maintainer: Armin Preiml <apreiml@strohwolke.at>

_gemname=enumerable-statistics
pkgname=ruby-$_gemname
pkgver=2.0.7
pkgrel=1
pkgdesc='Enumerable::Statistics provides some methods to calculate statistical summary in arrays and enumerables.'
arch=(any)
url='https://github.com/mrkn/enumerable-statistics'
license=(MIT)
depends=(ruby)
# options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  rm "$pkgdir/$_gemdir/extensions/$CARCH-linux/3.0.0/$_gemname-$pkgver/"{gem_make.out,mkmf.log}
}
sha256sums=('eeb84581376305327b31465e7b088146ea7909d19eb637d5677e51f099759636')

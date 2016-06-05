# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_gemname=mysql
pkgname=ruby-$_gemname
pkgver=2.9.1
pkgrel=1
pkgdesc='MySQL API module for Ruby'
arch=('any')
url='https://rubygems.org/gems/mysql/'
license=(Ruby)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('faf2d2cb4473e651f43c7cb2012285206d7d1b06')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

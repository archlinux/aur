# Maintainer: Anatoly Bashmakov <anatoly at posteo dot net>

_gemname=octicons
pkgname=ruby-$_gemname
pkgver=12.0.0
pkgrel=1
pkgdesc="A package that distributes Octicons in a gem"
arch=(any)
url='https://github.com/primer/octicons'
license=(MIT)
depends=(ruby ruby-nokogiri)
makedepends=(ruby-rdoc)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha1sums=('df960c707a56378d3d8c46f8fc7b19d665a7fb08')
noextract=($_gemname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -e 'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

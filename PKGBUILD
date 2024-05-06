_gemname=gemojione
pkgname=ruby-$_gemname
pkgver=4.3.3
pkgrel=1
pkgdesc='A gem for EmojiOne'
arch=(any)
url='http://github.com/jonathanwiesel/gemojione'
license=('MIT')
depends=(ruby ruby-json)
makedepends=(ruby-rdoc)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=('aa462341a968d3e1890e2a0c749a287fbfa74d4cff7269f8e0e2e47787288d3b')
noextract=($_gemname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -e 'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

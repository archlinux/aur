# Contributor: farawayer <farwayer@gmail.com>

_gemname=naturally
pkgname=ruby-$_gemname
pkgver=2.2.1
pkgrel=1
pkgdesc='Natural Sorting with support for legal numbering, course numbers, and other number/letter mixes.'
arch=(any)
url='https://github.com/public-law/naturally'
license=()
depends=(ruby)
makedepends=(ruby-rdoc)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('dbdd12d478236be97b95aa4fc8f406c6a43e505e')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

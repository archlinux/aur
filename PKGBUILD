# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_gemname=buftok
pkgname=ruby-$_gemname
pkgver=0.2.0
pkgrel=3
pkgdesc="BufferedTokenizer extracts token delimited entities from a sequence of arbitrary inputs."
arch=(any)
url='https://github.com/sferik/buftok'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('bad760334631e15b8eea608468709d3265e087703b5af0532f6583e277f0fae7')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

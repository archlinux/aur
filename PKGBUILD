# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=fast_gettext
pkgname=ruby-$_gemname
pkgver=1.2.0
pkgrel=1
pkgdesc='GetText but 3.5 x faster, 560 x less memory, simple, clean namespace (7 vs 34) and threadsafe!'
arch=(any)
url='https://github.com/grosser/fast_gettext'
license=('MIT')
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('a520a42174fa474f765d3f006b1bbaa4fd12f6ac44c2ea3eb5dac2e3277bf9f9')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}

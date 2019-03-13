# Maintainer: farwayer <farwayer@gmail.com>

_gemname=unicode-display_width
pkgname=ruby-${_gemname}
pkgver=1.5.0
pkgrel=1
pkgdesc="Determines the monospace display width of a string"
arch=('any')
depends=('ruby')
makedepends=('ruby-rdoc')
url="https://rubygems.org/gems/${_gemname}"
noextract=($_gemname-$pkgver.gem)
license=('MIT')
source=(
  "https://rubygems.org/downloads/${_gemname}-${pkgver}.gem"
)
sha256sums=('9890eebd24feb4cb0e0542c9b8c6beecb40cda27be8c7afe49312625b36156eb')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/MIT-LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

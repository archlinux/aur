# Maintainer: farawayer <farwayer@gmail.com>

_gemname=babosa
pkgname=ruby-$_gemname
pkgver=1.0.3
pkgrel=1
pkgdesc='A library for creating slugs.'
arch=(any)
url='http://github.com/norman/babosa'
license=()
depends=(ruby)
makedepends=(ruby-rdoc)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('a98f2db15e84ff9fc2d1cc71c4e128fd4020a61a')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/MIT-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/MIT-LICENSE"
}

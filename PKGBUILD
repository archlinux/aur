# Maintainer: wickdchromosome <capsule.edu@gmail.com>

_gemname=parslet
pkgname=ruby-$_gemname-1.5
pkgver=1.5.0
pkgrel=1
pkgdesc='Parser construction library with great error reporting in Ruby.'
arch=(any)
url='http://kschiess.github.com/parslet'
depends=(ruby ruby-blankslate-2)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('4c0f7a11134c4b65498c1ed1fda50c9def190b1e')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

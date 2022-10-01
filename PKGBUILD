# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_gemname=fog-dnsimple
pkgname=ruby-$_gemname
pkgver=2.1.0
pkgrel=1
pkgdesc='Module for the fog gem to support DNSimple.'
arch=(any)
url='https://github.com/fog/fog-dnsimple'
license=(MIT)
depends=(ruby-fog-core ruby-fog-json)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('c3a8df8b7613f0b7ee86e5c179ae143dbd8797ab67012ea1124699c4019b7f51')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}


# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_gemname=fog-cloudstack
pkgname=ruby-$_gemname
pkgver=0.1.0
pkgrel=1
pkgdesc='Module for the '\''fog'\'' gem to support Cloudstack.'
arch=(any)
url='https://github.com/fog/fog-cloudstack'
license=(MIT)
depends=(ruby-fog-core ruby-fog-json ruby-fog-xml)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('13efccf314d0cbb851344b7cc719c6eb117915a6afbc2eb86579e584b68edcd0')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}


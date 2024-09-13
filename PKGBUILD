# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_gemname=faraday-typhoeus
pkgname=ruby-$_gemname
pkgver=1.1.0
pkgrel=2
pkgdesc='Faraday adapter for Typhoeus'
arch=(any)
url='https://github.com/dleavitt/faraday-typhoeus'
license=(MIT)
depends=(ruby-faraday ruby-typhoeus)
makedepends=('ruby-rdoc')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('24c6147c213818dde3ebc50ae47ab92f9a7e554903aa362707126f749c6890e7')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

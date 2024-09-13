# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_gemname=travis-gh
pkgname=ruby-$_gemname
pkgver=0.21.0
pkgrel=1
pkgdesc='multi-layer client for the github api v3'
arch=(any)
url='https://github.com/travis-ci/gh'
license=(MIT)
depends=(ruby-activesupport ruby-addressable ruby-faraday ruby-faraday-retry ruby-faraday-typhoeus ruby-multi_json ruby-net-http-persistent ruby-net-http-pipeline)
makedepends=('ruby-rdoc')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('43265fdd15eab3a19422faf442cdf8f0508500542e835cd3cdc1029fe73f7a5b')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

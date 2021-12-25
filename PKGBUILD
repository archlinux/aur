# Maintainer: Jonne Haß <me@jhass.eu>

_gemname=faraday-detailed_logger
pkgname=ruby-$_gemname
pkgver=2.4.2
pkgrel=1
pkgdesc='A detailed request and response logger for Faraday.'
arch=(any)
url='https://github.com/envylabs/faraday-detailed_logger'
license=(MIT)
depends=(ruby ruby-faraday)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('c4a645d9cfe5f4e6a0112c9f7439a364d9d0233a')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

# Maintainer: Jonne Haß <me@jhass.eu>

_gemname=acme_nsupdate
pkgname=ruby-$_gemname
pkgver=0.4.5
pkgrel=2
pkgdesc='ACME (Let'\''s Encrypt) client with nsupdate (DDNS) integration.'
arch=(any)
url='https://github.com/jhass/acme_nsupdate'
license=(MIT)
depends=(ruby ruby-slop ruby-acme-client ruby-faraday-detailed_logger)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('1147fb224656d66ceaf7be551d5093d0907626d5')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

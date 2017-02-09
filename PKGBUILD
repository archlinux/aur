# Maintainer: Jonne Haß <me@jhass.eu>

_gemname=acme_nsupdate
pkgname=ruby-$_gemname
pkgver=0.3.2
pkgrel=1
pkgdesc='ACME (Let'\''s Encrypt) client with nsupdate (DDNS) integration.'
arch=(any)
url='https://github.com/jhass/acme_nsupdate'
license=(MIT)
depends=(ruby ruby-slop ruby-acme-client ruby-faraday-detailed_logger)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('2276c16f1d8e8c241664f775fe43d71dea83905b')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

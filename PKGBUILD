# Maintainer: Anatoly Bashmakov <anatoly at posteo dot net>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>

_gemname=ipaddress
pkgname=ruby-$_gemname
pkgver=0.8.3
pkgrel=2
pkgdesc="IPv4/IPv6 addresses manipulation library"
arch=(any)
url="http://github.com/bluemonk/ipaddress"
license=(MIT)
depends=(ruby)
makedepends=(ruby-rdoc)
options=(!emptydirs)
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('4451c0877d08c012546c4dde9d7603b5bc326ae2')

package() {
  local _gemdir="$(ruby -e 'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

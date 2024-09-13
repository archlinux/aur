# Contributor: DDoSolitary <DDoSolitary@gmail.com>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=typhoeus
pkgname=ruby-$_gemname
pkgver=1.4.1
pkgrel=2
pkgdesc='Parallel HTTP library on top of libcurl multi.'
arch=(any)
url='https://github.com/typhoeus/typhoeus'
license=(MIT)
depends=(ruby ruby-ethon)
makedepends=(ruby-rdoc)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('1c17db8364bd45ab302dc61e460173c3e69835896be88a3df07c206d5c55ef7c')

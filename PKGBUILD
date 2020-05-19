# Maintainer: DDoSolitary <DDoSolitary@gmail.com>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=typhoeus
pkgname=ruby-$_gemname
pkgver=1.4.0
pkgrel=1
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
sha512sums=('f48a99fd554f4d06d37a0a804ee79dd8423d9bff765394537ab0edba615e132d25660a6eb455e8628f59bd56c7ea26f4a195827d5287a53e58e3aeb394477284')

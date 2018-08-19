# Maintainer: DDoSolitary <DDoSolitary@gmail.com>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=typhoeus
pkgname=ruby-$_gemname
pkgver=1.3.0
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
sha512sums=('c51458c27ff07cbde095d22e0d98c1602b2b2cb67f7e0f8f27ab931d8b3c62cd7a256f3baaefa88852f96769508e61290eb7eefceaff5f28912aef292eb56269')

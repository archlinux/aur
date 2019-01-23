# Maintainer: DDoSolitary <DDoSolitary@gmail.com>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=typhoeus
pkgname=ruby-$_gemname
pkgver=1.3.1
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
sha512sums=('f826cdb7e48577226b12fc2715123e13519148f67d036470e385f80f8f3112d1ad24bf580c2ed0d213242c9afc1bdf868084266d430858b2cf6de73e50a11422')

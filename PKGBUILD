# Maintainer: DDoSolitary <DDoSolitary@gmail.com>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=typhoeus
pkgname=ruby-$_gemname-0.6
pkgver=0.6.9
pkgrel=2
pkgdesc='Parallel HTTP library on top of libcurl multi.'
arch=(any)
url='https://github.com/typhoeus/typhoeus'
license=(MIT)
provides=("ruby-$_gemname=$pkgver")
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
sha512sums=('5063d3217f35db29d216327b6eed10d6613d018c496935e78aa8e2b10ec21f3372df11fe48155b45387767d5572efa93e74afb0bb9b10782d28e87dead0294a4')

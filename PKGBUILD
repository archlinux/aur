# Maintainer: Husam Bilal <husam212@gmail.com>

_gemname=power_assert
pkgname=ruby-$_gemname
pkgver=1.0.1
pkgrel=1
pkgdesc='Power Assert for Ruby'
arch=(any)
url='https://github.com/k-tsj/power_assert'
license=(BSD)
depends=(ruby)
makedepends=(rubygems)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('a51f4adaaf3d73dd87c12ab3f2d95b86f94ec1090af7970b63ba5281a0eda8ed')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/BSDL" "$pkgdir/usr/share/licenses/$pkgname/BSDL"
}


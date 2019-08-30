# Maintainer: Bert Peters <bert@bertptrs.nl>

_gemname=sassc
pkgname=ruby-$_gemname
pkgver=2.2.0
pkgrel=1
pkgdesc='Use libsass with Ruby!'
arch=('x86_64')
url='https://github.com/sass/sassc-ruby'
license=(MIT)
depends=(ruby ruby-ffi)
makedepends=(ruby-rdoc)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('6e7e4fe5eae9593c29e5dd6c830b91530b92e044b3d3efa89898fca22a75119d')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

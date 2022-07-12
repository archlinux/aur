# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_gemname=debug
pkgname=ruby-$_gemname
pkgver=1.6.0
pkgrel=1
pkgdesc='Debugging functionality for Ruby'
arch=(any)
url='https://github.com/ruby/debug'
license=(BSD-2)
depends=(
  'ruby>=2.6.0'
  'ruby-irb>=1.3.6'
  'ruby-reline>=0.3.1'
)
makedepends=('gcc' 'make')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('dc12d8fbd5e990ec3b4d53151cefeaab2f4fb1b9aeee52e750f27b27dbbd0ee4')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

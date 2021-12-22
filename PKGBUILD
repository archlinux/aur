# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_gemname=debug
pkgname=ruby-$_gemname
pkgver=1.0.0.beta8
pkgrel=1
pkgdesc='Debugging functionality for Ruby'
arch=(any)
url='https://github.com/ruby/debug'
license=(BSD-2)
depends=(
  'ruby>=2.6.0'
  'ruby-irb'
)
makedepends=('make')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('4f0e761bc7b9d896ac9f38df1653e4703c5db73736d3ab126b09239e9f7cb605')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

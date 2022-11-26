# Maintainer: Wu Junyu (aka Tenshi65535) <wu.junyu.aur@outlook.com>
# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_gemname=debug
pkgname=ruby-$_gemname
pkgver=1.6.3
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
sha256sums=('335f109abe39c1e3465df2d2f17f5108e2934070442e73c0a14d09de54012341')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

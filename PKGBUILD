# Maintainer: Wu Junyu (aka Tenshi65535) <wu.junyu.aur@outlook.com>
# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_gemname=debug
pkgname=ruby-$_gemname
pkgver=1.7.0
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
sha256sums=('75aa5a95fae30aec7be9d6d50b980a920bfb3393df358831aba90d43757b7460')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

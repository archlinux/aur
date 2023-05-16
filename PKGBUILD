# Maintainer: Wu Junyu (aka Tenshi65535) <wu.junyu.aur@outlook.com>
# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_gemname=debug
pkgname=ruby-$_gemname
pkgver=1.8.0
pkgrel=1
pkgdesc='Debugging functionality for Ruby'
arch=(any)
url='https://github.com/ruby/debug'
license=(BSD-2)
depends=(
  'ruby>=2.6.0'
  'ruby-irb>=1.5.0'
  'ruby-reline>=0.3.1'
)
makedepends=('gcc' 'make')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('502bd1ad41a9a4b51f557f181cd13650c746390a82b5d11a5d2c81600ca013da')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

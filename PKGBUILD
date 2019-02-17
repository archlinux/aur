# Maintainer: Dmitry Kharitonov <darksab0r@gmail.com>

_gemname=multiio
pkgname=ruby-$_gemname
pkgver=0.1.0
pkgrel=1
pkgdesc='MultiIO Ruby lib for outputting to multiple IO sources (e.g. STDOUT, file)'
arch=('any')
url='https://github.com/clintmod/multiio'
license=(unknown)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('184bd9c272592904d3c24d19545039cb9ce477d6fa6dc9916754d6eba3935a74')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

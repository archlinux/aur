# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=capistrano-harrow
pkgname=ruby-$_gemname
pkgver=0.5.1
pkgrel=1
pkgdesc='A plugin for tighter integration with Harrow.io whilst using Capistrano.'
arch=(any)
url='https://harrow.io'
license=('MIT')
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('aed48a16c755d6108a6ae900f15750c2b3b00bd7e3583413c54a8e45b662491b')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}

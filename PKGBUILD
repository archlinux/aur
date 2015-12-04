# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=little-plugger
pkgname=ruby-$_gemname
pkgver=1.1.4
pkgrel=1
pkgdesc='LittlePlugger is a module that provides Gem based plugin management.'
arch=(any)
url='http://gemcutter.org/gems/little-plugger'
depends=('ruby')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('79b26509c56084a93997e011870de085f9e5222d631bf410c9bb2a361949e80f3d8be279b26b6c405dd47aedbea72089de212990ae0906f7493a3e8edfa8cb87')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

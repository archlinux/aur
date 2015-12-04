# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=mixlib-log
pkgname=ruby-$_gemname
pkgver=1.6.0
pkgrel=1
pkgdesc='A gem that provides a simple mixin for log functionality'
arch=(any)
url='http://www.opscode.com/'
depends=('ruby')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('59103c7bc5383a30a393b290ae293a210d15c072a85a9085189c4697345469d251a32528cad963378458b16acf9c0cf1bd452afb90b989c13a3e024778141c2a')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

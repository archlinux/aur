# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=gyoku
pkgname=ruby-$_gemname
pkgver=1.4.0
pkgrel=2
pkgdesc='Gyoku translates Ruby Hashes to XML'
arch=(any)
url='https://github.com/savonrb/gyoku'
license=(MIT)
depends=('ruby' 'ruby-builder>=2.1.2' 'ruby-rexml')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('10c16f62ba683236892a269e661e84c1e4ed5190732c03de546c1ed00db11c4a3f442b2ac45f5134a2c452a7f27310a60a44be7df636231db3219c3e546945ee')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

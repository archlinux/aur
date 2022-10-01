# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=xml-simple
pkgname=ruby-$_gemname
pkgver=1.1.9
pkgrel=1
pkgdesc='A simple API for XML processing.'
arch=(any)
url='https://github.com/maik/xml-simple'
license=(MIT)
depends=(ruby-rexml)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('cdc7a8d62fb006a1c8a895bbd8b0c64d912bc4475bdcce167ee34edb039269b087109e191979b4d7f14333eb4cc1a93bf74be849d8bf6eeb83075b2a9b1752e9')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

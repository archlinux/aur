# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=liquid
pkgname=ruby-$_gemname-2
pkgver=2.6.3
pkgrel=1
pkgdesc='A secure, non-evaling end user template engine with aesthetic markup.'
arch=('any')
url='http://www.liquidmarkup.org'
license=('MIT')
depends=('ruby')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/MIT-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/MIT-LICENSE"
}
sha512sums=('89d8fce94b351cbf13d3531ebdcaadb44bfad8d74356be58e3c6bcf957f6815f4fb96479f9a616147c04b7a5ffc99559374c04d957f62bbd7481e92235d5740f')

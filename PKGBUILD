# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=uuidtools
pkgname=ruby-$_gemname
pkgver=2.1.5
pkgrel=1
pkgdesc='A simple universally unique ID generation library.'
arch=(any)
url='https://github.com/sporkmonger/uuidtools'
depends=('ruby')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('c56e6329e48638bd5049d348beedec7fadb9ee7a133a5013ddd41ae98baa8213d8944903059729c9ca4f38b24d9b565b5653332685982337a4233f11d4865ac0')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

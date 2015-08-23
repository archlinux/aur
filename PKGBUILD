# Maintainer: Vojtěch Aschenbrenner <v@asch.cz>

_gemname=gpgme
pkgname=ruby-$_gemname
pkgver=2.0.9
pkgrel=1
pkgdesc='Ruby binding of GPGME.'
arch=(i686 x86_64)
url='http://github.com/ueno/ruby-gpgme'
license=(LGPL-2.1+)
depends=(ruby ruby-mini_portile)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('5b47db9402b5c03fd617d3436605ae65d18c4933')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

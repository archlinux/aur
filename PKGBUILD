# Maintainer: Vojtěch Aschenbrenner <v@asch.cz>

_gemname=gpgme
pkgname=ruby-$_gemname
pkgver=2.0.8
pkgrel=1
pkgdesc='Ruby binding of GPGME.'
arch=(i686 x86_64)
url='https://github.com/ueno/ruby-gpgme'
license=(GPL2)
depends=(gmp gpgme libgpg-error libassuan ruby ruby-mini_portile-0.6.0)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('df49d45cd095fc3ce880a7e2c20e1da2b93fa8c6')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem -- --use-system-libraries
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

  rm -rf "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/ext"
}

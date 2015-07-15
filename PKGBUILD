# Maintainer: Vojtěch Aschenbrenner <v@asch.cz>

_gemname=lockfile
pkgname=ruby-$_gemname
pkgver=2.1.3
pkgrel=1
pkgdesc='lockfile'
arch=(any)
url='https://github.com/ahoward/lockfile'
license=(Ruby)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('5d36877fe358ab53a032b838d0b7f9ec6c7d09a0')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

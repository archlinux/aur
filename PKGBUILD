# Maintainer: envolution
# Contributor: Vojtěch Aschenbrenner <v@asch.cz>

_gemname=ncursesw
pkgname=ruby-ncursesw
pkgver=1.4.11
pkgrel=1
pkgdesc='wraps functions, macros, global variables and constants of the ncurses library.'
arch=(i686 x86_64)
url='http://github.com/sup-heliotrope/ncursesw-ruby'
license=(GPL-2.0-or-later)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('72d2c0ebeab9616fdc7582c37fd0f9262c023054')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

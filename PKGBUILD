# Maintainer: Vojtěch Aschenbrenner <v@asch.cz>

_gemname=xapian-ruby
pkgname=ruby-$_gemname
pkgver=1.2.21
pkgrel=1
pkgdesc='xapian libraries and ruby bindings'
arch=(i686 x86_64)
url='https://github.com/garaio/xapian-ruby'
license=()
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('8155fccc68623048fdc3e14060122f2e5fe0ade7')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

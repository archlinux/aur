# Maintainer: Vojtěch Aschenbrenner <v@asch.cz>

_gemname=locale
pkgname=ruby-$_gemname
pkgver=2.1.2
pkgrel=2
pkgdesc='Ruby-Locale is the pure ruby library which provides basic APIs for localization.'
arch=(any)
url='https://github.com/ruby-gettext/locale'
license=(Ruby LGPLv3+)
depends=(ruby ruby-rdoc)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('e4e70de4b0cbbc641afa8cf90833fb0057318d27')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

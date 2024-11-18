# Maintainer: envolution
# Contributor: Vojtěch Aschenbrenner <v@asch.cz>

_gemname=unicode
pkgname=ruby-unicode
pkgver=0.4.4.5
pkgrel=2
pkgdesc='Unicode normalization library.'
arch=(i686 x86_64)
url='https://github.com/blackwinter/unicode'
license=(custom:none)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('89dd3d0e8511e41e56f798fb18c3d84d52ad69aa')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

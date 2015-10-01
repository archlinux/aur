# Maintainer: Marcel Korpel <marcel[dot]korpel[at]gmail>
# Contributor: Vojtěch Aschenbrenner <v@asch.cz>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Peter Richard Lewis <plewis@aur.archlinux.org>
# Contributor: Emiliano Vavassori <syntaxerrormmm@gmail.com>

pkgname=ruby-highline
_gemname=highline
pkgver=1.7.7
pkgrel=1
pkgdesc="A high-level text user interface toolkit for Ruby"
arch=('any')
url="http://rubygems.org/gems/highline"
license=('GPL2' 'RUBY')
depends=('ruby')
options=(!emptydirs)
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha256sums=('4acd3a1f8eddb11443e7912f8ed0c688919c85c4ed193a568165d804b7a28add')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

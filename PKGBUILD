# Maintainer: Marcel Korpel <marcel[dot]korpel[at]gmail>
# Contributor: Vojtěch Aschenbrenner <v@asch.cz>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Peter Richard Lewis <plewis@aur.archlinux.org>
# Contributor: Emiliano Vavassori <syntaxerrormmm@gmail.com>

pkgname=ruby-highline
_gemname=highline
pkgver=1.7.2
pkgrel=1
pkgdesc="A high-level text user interface toolkit for Ruby"
arch=('any')
url="http://rubygems.org/gems/highline"
license=('GPL2' 'RUBY')
depends=('ruby')
options=(!emptydirs)
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha256sums=('5beef0869e444075e701ffd87f47a9ebc6beb4c417976425d454d2775bdf9d91')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

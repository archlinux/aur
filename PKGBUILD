# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-state_machine
pkgver=1.2.0
pkgrel=1
pkgdesc="Adds support for creating state machines for attributes on any Ruby class"
arch=('any')
url="https://github.com/pluginaweek/state_machine"
license=('MIT')
depends=('ruby')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('80fcddc91976baec8713c37c28b5bc0655f5f2e0a1412a1a4a3aac41082cc2ed')
noextract=("${pkgname#*-}-${pkgver}.gem")

package() {
  cd "$srcdir"

  msg 'Installing...'
  gem install \
    --no-user-install \
    --ignore-dependencies \
    -i "$pkgdir$(ruby -rubygems -e'puts Gem.default_dir')" \
    ${pkgname#*-}-$pkgver.gem
}

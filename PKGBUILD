# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-parser
pkgver=2.3.0.5
pkgrel=1
pkgdesc="A Ruby parser written in pure Ruby"
arch=('any')
url="https://github.com/whitequark/parser"
license=('MIT')
depends=('ruby' 'ruby-ast')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('0b98382ca469cf7dd0da59aa1cb38446c97a7a1b624f115987db0f17ded5dca1')
noextract=("${pkgname#*-}-${pkgver}.gem")

package() {
  cd "$srcdir"

  msg2 'Installing...'
  gem install \
    --no-user-install \
    --ignore-dependencies \
    -i "$pkgdir$(ruby -rubygems -e'puts Gem.default_dir')" \
    ${pkgname#*-}-$pkgver.gem
}

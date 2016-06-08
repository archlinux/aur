# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-ast
pkgver=2.3.0
pkgrel=1
pkgdesc="A library for working with Abstract Syntax Trees"
arch=('any')
url="https://whitequark.github.io/ast/"
license=('MIT')
depends=('ruby')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('15d97cf7f3430351a8663f2c5fb7591fb29f700fa28576c46c53b992e912e85e')
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

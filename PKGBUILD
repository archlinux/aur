# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-ast
pkgver=2.2.0
pkgrel=1
pkgdesc="A library for working with Abstract Syntax Trees"
arch=('any')
url="https://whitequark.github.io/ast/"
license=('MIT')
depends=('ruby')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('8be669575d41b7b961a3e6ed370e550bed6083b3f8337ab6c8b506871c02ad92')
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

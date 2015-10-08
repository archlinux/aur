# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-parser
pkgver=2.2.3.0
pkgrel=1
pkgdesc="A Ruby parser written in pure Ruby"
arch=('any')
url="https://github.com/whitequark/parser"
license=('MIT')
depends=('ruby' 'ruby-ast')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('4cb1cf8b34f8d331c9f4a02e4b2f8068cde73b1c957c9c6f24401251d503ab91')
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

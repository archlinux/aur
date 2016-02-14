# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-parser
pkgver=2.3.0.6
pkgrel=1
pkgdesc="A Ruby parser written in pure Ruby"
arch=('any')
url="https://github.com/whitequark/parser"
license=('MIT')
depends=('ruby' 'ruby-ast')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('7fc1c0b72d237c8842ff15d8709acda05cacd38492ce5065dfb1304d659924e4')
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

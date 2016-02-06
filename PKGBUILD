# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-parser
pkgver=2.3.0.3
pkgrel=1
pkgdesc="A Ruby parser written in pure Ruby"
arch=('any')
url="https://github.com/whitequark/parser"
license=('MIT')
depends=('ruby' 'ruby-ast')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('1ed3803483808c3104d9360f0a11c0220e7b796da496e81b51f52fdecb91eea9')
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

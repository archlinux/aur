# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-parser
pkgver=2.3.0.2
pkgrel=1
pkgdesc="A Ruby parser written in pure Ruby"
arch=('any')
url="https://github.com/whitequark/parser"
license=('MIT')
depends=('ruby' 'ruby-ast')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('4941df938d747bea9922468ce76c7364851439084b09bb066e12314aec2ef03d')
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

# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-rkelly-remix
pkgver=0.0.7
pkgrel=1
pkgdesc="Pure Ruby JavaScript parser and interpreter"
arch=('any')
url="https://github.com/whitequark/parser"
license=('MIT')
depends=('ruby')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('72f870b39931daa49ac1c78ceadeeeaebf0eee7395597afc28c99d6e1395f0bc')
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

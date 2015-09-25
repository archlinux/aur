# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-babel-source
pkgver=5.8.26
pkgrel=1
pkgdesc="Babel JS source"
arch=('any')
url="https://rubygems.org/gems/babel-source"
license=('MIT')
depends=('ruby')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('7fa575c18695cdb508fee5d08de7f2acdcc8a9f73e6e241908c5c76f7723082e')
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

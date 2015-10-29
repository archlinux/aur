# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-babel-source
pkgver=5.8.33
pkgrel=1
pkgdesc="Babel JS source"
arch=('any')
url="https://rubygems.org/gems/babel-source"
license=('MIT')
depends=('ruby')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('d2ec1197cd461ae3d61274d0c308ef841b11a1c9dae4c11bb0afe23d71846b59')
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

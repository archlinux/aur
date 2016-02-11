# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-opener
pkgver=0.1.0
pkgrel=1
pkgdesc="A 33-line alternative to the popular launchy library"
arch=('any')
depends=('ruby')
url="https://github.com/sunaku/opener"
license=('BSD')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('7fe5ccc88aa97c24386b562d132ee267280fb3ad14e471d9105b3a56a18cfd59')
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

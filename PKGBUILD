# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-babel-source
pkgver=5.8.30
pkgrel=1
pkgdesc="Babel JS source"
arch=('any')
url="https://rubygems.org/gems/babel-source"
license=('MIT')
depends=('ruby')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('9c100a1b0720e0a4eb0e2a494d801d20bd0bfafb3f47960107c3f580cf9f6d0d')
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

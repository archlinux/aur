# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-sourcemap
pkgver=0.1.1
pkgrel=1
pkgdesc="A Ruby library to read, create and manipulate Source Maps"
arch=('any')
url="https://github.com/maccman/sourcemap"
license=('MIT')
depends=('ruby')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('889fc666bdf7182d09abff3461088547c0510d004dc47a73094f409cde0f2150')
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

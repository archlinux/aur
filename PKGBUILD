# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-rasciiart
pkgver=0.0.9
pkgrel=1
pkgdesc="A command line tool to turn images into ASCII art"
arch=('any')
depends=('ruby' 'ruby-rainbow' 'ruby-rmagick')
url="https://github.com/nodanaonlyzuul/asciiart"
license=('MIT')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('15f85bc41ee8d5143fbef534d2c1115ecdff544601a8007554eb07001736795c')
noextract=("${pkgname#*-}-${pkgver}.gem")
provides=('asciiart' 'ruby-rasciiart')
conflicts=('asciiart')

package() {
  cd "$srcdir"

  msg2 'Installing...'
  gem install \
    --no-user-install \
    --ignore-dependencies \
    -i "$pkgdir$(ruby -rubygems -e'puts Gem.default_dir')" \
    ${pkgname#*-}-$pkgver.gem
}

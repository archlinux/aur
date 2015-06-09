# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-asciiart
pkgver=0.0.9
pkgrel=1
pkgdesc="A command line tool to turn images into ASCII art"
arch=('any')
depends=('ruby' 'ruby-rainbow' 'ruby-rmagick')
url="https://github.com/nodanaonlyzuul/asciiart"
license=('MIT')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('130b9d041e85977779fce72927d77b7452ed644c61138ae477aca000c5791e55')
noextract=("${pkgname#*-}-${pkgver}.gem")
provides=('asciiart' 'ruby-asciiart')
conflicts=('asciiart')

package() {
  cd "$srcdir"

  msg 'Installing...'
  gem install \
    --no-user-install \
    --ignore-dependencies \
    -i "$pkgdir$(ruby -rubygems -e'puts Gem.default_dir')" \
    ${pkgname#*-}-$pkgver.gem
}

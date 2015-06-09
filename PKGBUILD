# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-veewee-to-packer
pkgver=0.3.0
pkgrel=1
pkgdesc="A tool for converting Veewee templates into Packer templates"
arch=('any')
url="https://github.com/mitchellh/veewee-to-packer"
license=('MIT')
depends=('ruby')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('ddbdcaa797aedbec09d8a6036be27c2df6802ac302bbc01d3b09d3aeeda65d85')
noextract=("${pkgname#*-}-${pkgver}.gem")
provides=('ruby-veewee-to-packer' 'veewee-to-packer')
conflicts=('veewee-to-packer')

package() {
  cd "$srcdir"

  msg 'Installing...'
  gem install \
    --no-user-install \
    --ignore-dependencies \
    -i "$pkgdir$(ruby -rubygems -e'puts Gem.default_dir')" \
    ${pkgname#*-}-$pkgver.gem
}

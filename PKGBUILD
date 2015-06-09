# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-artii
pkgver=2.1.1
pkgrel=1
pkgdesc="A Figlet-based ASCII art generator, useful for comand-line based ASCII Art Generation"
arch=('any')
depends=('ruby')
url="https://github.com/miketierney/artii"
license=('MIT')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('9b683c36f0eb5aa8c02c767d00cd7e70de1b84ff50396b47dc098789ec465861')
noextract=("${pkgname#*-}-${pkgver}.gem")
provides=('artii' 'ruby-artii')
conflicts=('artii')

package() {
  cd "$srcdir"

  msg 'Installing...'
  gem install \
    --no-user-install \
    --ignore-dependencies \
    -i "$pkgdir$(ruby -rubygems -e'puts Gem.default_dir')" \
    ${pkgname#*-}-$pkgver.gem
}

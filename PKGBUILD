# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-awesome_print
pkgver=1.7.0
pkgrel=1
pkgdesc="Pretty print your Ruby objects with style"
arch=('any')
depends=('ruby')
url="https://github.com/michaeldv/awesome_print"
license=('MIT')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('a4ea7e755c4aab68157ea3d67b94aa375d01b85c4670db3d3afcc7296f0c1e7e')
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

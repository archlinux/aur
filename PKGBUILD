# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-gemoji
pkgver=2.1.0
pkgrel=1
pkgdesc="Image assets and character information for emoji"
arch=('any')
url="https://github.com/github/gemoji"
license=('custom:MIT')
depends=('ruby')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('dcacc532537b6244a9ea104a8e7e7ce883a8302843aeef861798b34cc3357958')
noextract=("${pkgname#*-}-${pkgver}.gem")

package() {
  cd "$srcdir"

  msg 'Installing...'
  gem install \
    --no-user-install \
    --ignore-dependencies \
    -i "$pkgdir$(ruby -rubygems -e'puts Gem.default_dir')" \
    ${pkgname#*-}-$pkgver.gem
}

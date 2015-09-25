# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-starscope
pkgver=1.5.0
pkgrel=1
pkgdesc="Smart code searching and indexing"
arch=('any')
url="https://github.com/eapache/starscope"
license=('MIT')
depends=('ruby'
         'ruby-babel-transpiler'
         'ruby-oj'
         'ruby-parser'
         'ruby-ruby-progressbar'
         'ruby-rkelly-remix'
         'ruby-sourcemap')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('80ab7a71832064292fcaf234d98ecc23e088d946dd308d5e60fd68866e67281f')
noextract=("${pkgname#*-}-${pkgver}.gem")
provides=('ruby-starscope' 'starscope')
conflicts=('starscope')

package() {
  cd "$srcdir"

  msg2 'Installing...'
  gem install \
    --no-user-install \
    --ignore-dependencies \
    -i "$pkgdir$(ruby -rubygems -e'puts Gem.default_dir')" \
    ${pkgname#*-}-$pkgver.gem
}

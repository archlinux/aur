# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-starscope
pkgver=1.5.1
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
sha256sums=('0dcc38df346ab04dbe87d49f370113f34711887dda51c025d8fb301f17b5cd64')
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

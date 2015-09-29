# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-html-pipeline
pkgver=2.2.0
pkgrel=1
pkgdesc="GitHub HTML processing filters and utilities"
arch=('any')
url="https://github.com/jch/html-pipeline"
license=('MIT')
depends=('ruby' 'ruby-activesupport' 'ruby-nokogiri')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('3d36c95d20d019867b4d564e86d8bd6310fa9678e04c7bd7ab011daac0ae49ed')
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

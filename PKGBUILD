# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-html-pipeline
pkgver=2.2.2
pkgrel=1
pkgdesc="GitHub HTML processing filters and utilities"
arch=('any')
url="https://github.com/jch/html-pipeline"
license=('MIT')
depends=('ruby' 'ruby-activesupport' 'ruby-nokogiri')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('2015691b8fb57fcfb3eda56a02f90124365820020076939b326aa8bd53eb1d73')
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

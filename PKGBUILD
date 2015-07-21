# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-html-pipeline
pkgver=2.0
pkgrel=1
pkgdesc="GitHub HTML processing filters and utilities"
arch=('any')
url="https://github.com/jch/html-pipeline"
license=('MIT')
depends=('ruby' 'ruby-activesupport' 'ruby-nokogiri')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('2cedb2f8d8506c8b5b334a1f0d7c6885059b96518852b5dc7cc23c065e51a67f')
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

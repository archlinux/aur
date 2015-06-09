# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-html-pipeline
pkgver=1.11.0
pkgrel=1
pkgdesc="GitHub HTML processing filters and utilities"
arch=('any')
url="https://github.com/jch/html-pipeline"
license=('MIT')
depends=('ruby' 'ruby-activesupport' 'ruby-nokogiri')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('3461d1f709ef4812f11cc9789bdebb801813ba726e5544df3aad6c62336d93f9')
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

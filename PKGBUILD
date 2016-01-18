# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-html-pipeline
pkgver=2.2.4
pkgrel=1
pkgdesc="GitHub HTML processing filters and utilities"
arch=('any')
url="https://github.com/jch/html-pipeline"
license=('MIT')
depends=('ruby' 'ruby-activesupport' 'ruby-nokogiri')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('262a6747fa6fca9ad8a6c0ed72e7d08932bf620cd1f283c768cb385d9983210d')
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

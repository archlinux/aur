# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>
pkgname=ruby-httparty
pkgver=0.13.7
pkgrel=1
pkgdesc="Makes http fun! Also, makes consuming restful web services dead easy."
arch=('any')
url="https://rubygems.org/gems/httparty"
license=('MIT')
depends=('ruby' 'ruby-json' 'ruby-multi_xml')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('c9b9a31d80af2e5bc5e2a7c37efc5d8aad4c8d9c58b82f18e4ff37cfef7223d5')
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



# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>
pkgname=ruby-httparty
pkgver=0.13.7
pkgrel=2
pkgdesc="Makes http fun! Also, makes consuming restful web services dead easy."
arch=('any')
url="https://rubygems.org/gems/httparty"
license=('MIT')
depends=('ruby' 'ruby-json' 'ruby-multi_xml')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('22c3f4d2681aeb083d4703405799fbc96453ff0d38c3ae3c1e5070dcccdb2f31')
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



# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-citrus
pkgver=3.0.2
pkgrel=1
pkgdesc="Parsing Expressions for Ruby"
arch=('any')
url="https://mjackson.me/citrus"
license=('MIT')
depends=('ruby')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('4ec2412fc389ad186735f4baee1460f7900a8e130ffe3f216b30d4f9c684f650')
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

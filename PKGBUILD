# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-toml-rb
pkgver=0.3.14
pkgrel=1
pkgdesc="A parser for TOML using Citrus library"
arch=('any')
url="https://github.com/emancu/toml-rb"
license=('MIT')
depends=('ruby' 'ruby-citrus')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('ea2824e01479b653e4648c4a66e1cf5620af8f87e67614b75346b269c23bd5dd')
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

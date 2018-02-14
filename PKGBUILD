# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

_gemname=ast
pkgname=ruby-$_gemname
pkgver=2.4.0
pkgrel=1
pkgdesc="A library for working with Abstract Syntax Trees"
arch=('any')
url="https://whitequark.github.io/ast/"
license=('MIT')
depends=('ruby')
makedepends=('ruby-rdoc')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('a7270b78d8c970e90a5b932471c691e3ca74aa8be030f1a954d38ec487d79aa0')
noextract=("${pkgname#*-}-$pkgver.gem")

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" "$_gemname-$pkgver.gem"
}

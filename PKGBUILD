# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-babel-transpiler
pkgver=0.7.0
pkgrel=1
pkgdesc="Ruby Babel JS Compiler"
arch=('any')
url="https://github.com/babel/ruby-babel-transpiler"
license=('MIT')
depends=('ruby' 'ruby-babel-source' 'ruby-execjs')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('4c06f4ad9e8e1cabe94f99e11df2f140bb72aca9ba067dbb49dc14d9b98d1570')
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

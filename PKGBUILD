# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-starscope
pkgver=1.4.0
pkgrel=1
pkgdesc="A tool like the venerable cscope, but for ruby, golang and other languages"
arch=('any')
url="https://github.com/eapache/starscope"
license=('MIT')
depends=('ruby'
         'ruby-backports'
         'ruby-oj'
         'ruby-parser'
         'ruby-ruby-progressbar')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('197c3793112fd5b617aa8f74b398dd76b2b55d427656cd97458836a9d2af785d')
noextract=("${pkgname#*-}-${pkgver}.gem")
provides=('ruby-starscope' 'starscope')
conflicts=('starscope')

package() {
  cd "$srcdir"

  msg 'Installing...'
  gem install \
    --no-user-install \
    --ignore-dependencies \
    -i "$pkgdir$(ruby -rubygems -e'puts Gem.default_dir')" \
    ${pkgname#*-}-$pkgver.gem
}

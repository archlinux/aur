# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-starscope
pkgver=1.3.3
pkgrel=1
pkgdesc="A tool like the venerable cscope, but for ruby, golang and other languages"
arch=('any')
url="https://github.com/eapache/starscope"
license=('MIT')
depends=('ruby' 'ruby-oj' 'ruby-parser' 'ruby-ruby-progressbar')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('08637f6548e9f21dff76d4d593b42a90959a581c0ab4db0bd239547107972ee0')
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

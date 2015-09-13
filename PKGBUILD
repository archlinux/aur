# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-starscope
pkgver=1.4.1
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
sha256sums=('c7db7166da3a0d5fac9900322c053ee4af7e0b65fbb743956be78d7805320842')
noextract=("${pkgname#*-}-${pkgver}.gem")
provides=('ruby-starscope' 'starscope')
conflicts=('starscope')

package() {
  cd "$srcdir"

  msg2 'Installing...'
  gem install \
    --no-user-install \
    --ignore-dependencies \
    -i "$pkgdir$(ruby -rubygems -e'puts Gem.default_dir')" \
    ${pkgname#*-}-$pkgver.gem
}

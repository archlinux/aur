# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-binman
pkgver=4.1.0
pkgrel=1
pkgdesc="Produces UNIX manual pages for executable scripts"
arch=('any')
depends=('ruby' 'ruby-opener')
url="https://github.com/sunaku/binman"
license=('ISC')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('69bb96e992eaccb82871b2eda2201645471a78ab76bcb20121f75cb20a57fe30')
noextract=("${pkgname#*-}-${pkgver}.gem")
provides=('binman' 'ruby-binman')
conflicts=('binman')

package() {
  cd "$srcdir"

  msg2 'Installing...'
  gem install \
    --no-user-install \
    --ignore-dependencies \
    -i "$pkgdir$(ruby -rubygems -e'puts Gem.default_dir')" \
    ${pkgname#*-}-$pkgver.gem
}

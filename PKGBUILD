# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-binman
pkgver=5.0.1
pkgrel=1
pkgdesc="Produces UNIX manual pages for executable scripts"
arch=('any')
depends=('ruby' 'ruby-opener')
url="https://github.com/sunaku/binman"
license=('ISC')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('73501b43ab2a67fb7611199b07a920db41f33297fd0d8a93ef2867862508589c')
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

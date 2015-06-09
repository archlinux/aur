# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-md2man
pkgver=4.0.0
pkgrel=1
pkgdesc="Converts markdown documents into UNIX manual pages"
arch=('any')
url="http://sunaku.github.io/md2man/"
license=('ISC')
depends=('ruby' 'ruby-binman' 'ruby-redcarpet')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('c9ee3f4a244510022f33d7624d8f0e1be59c23dba656e732c91c715dd8134555')
noextract=("${pkgname#*-}-${pkgver}.gem")
provides=('md2man' 'ruby-md2man')
conflicts=('md2man')

package() {
  cd "$srcdir"

  msg 'Installing...'
  gem install \
    --no-user-install \
    --ignore-dependencies \
    -i "$pkgdir$(ruby -rubygems -e'puts Gem.default_dir')" \
    ${pkgname#*-}-$pkgver.gem
}

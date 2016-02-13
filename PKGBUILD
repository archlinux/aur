# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-md2man
pkgver=5.0.1
pkgrel=1
pkgdesc="Converts markdown documents into UNIX manual pages"
arch=('any')
depends=('ruby' 'ruby-binman' 'ruby-redcarpet')
url="http://sunaku.github.io/md2man/"
license=('ISC')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('cf7473873ef79e82ee59b2d2af9316783dbf9a810f4bbb5dfa87143c89957fdc')
noextract=("${pkgname#*-}-${pkgver}.gem")
provides=('md2man' 'ruby-md2man')
conflicts=('md2man')

package() {
  cd "$srcdir"

  msg2 'Installing...'
  gem install \
    --no-user-install \
    --ignore-dependencies \
    -i "$pkgdir$(ruby -rubygems -e'puts Gem.default_dir')" \
    ${pkgname#*-}-$pkgver.gem
}

# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-md2man
pkgver=4.0.1
pkgrel=1
pkgdesc="Converts markdown documents into UNIX manual pages"
arch=('any')
depends=('ruby' 'ruby-binman' 'ruby-redcarpet')
url="http://sunaku.github.io/md2man/"
license=('ISC')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('e5c5a798e199c63c55c008f82b79e76dfc757ee0d4220de1ea2e1f0dd910f81a')
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

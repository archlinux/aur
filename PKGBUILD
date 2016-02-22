# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-md2man
pkgver=5.0.3
pkgrel=1
pkgdesc="Converts markdown documents into UNIX manual pages"
arch=('any')
depends=('ruby' 'ruby-binman' 'ruby-redcarpet')
url="http://sunaku.github.io/md2man/"
license=('ISC')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('71f653919a1b12a54b4776796490fde05b505a2678c448cbef25af8fdd31c48d')
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

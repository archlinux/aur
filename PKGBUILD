# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-rugged
pkgver=0.23.1
pkgrel=1
pkgdesc="Ruby binding to the libgit2 linkable library"
arch=('i686' 'x86_64')
url="https://github.com/libgit2/rugged"
license=('MIT')
depends=('libgit2' 'ruby')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('66ab84e9d20e33ed8588776aa7dbd60847ea1b8d5cb034d5b75c9e6caa4d218c')
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

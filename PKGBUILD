# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-rugged
pkgver=0.23.0
pkgrel=1
pkgdesc="Ruby binding to the libgit2 linkable library"
arch=('i686' 'x86_64')
url="https://github.com/libgit2/rugged"
license=('MIT')
depends=('libgit2' 'ruby')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('1f1a21a3c62d61da0bfd88213d6e2cb8be6c146644c57bf3dc08a7b39a67ef52')
noextract=("${pkgname#*-}-${pkgver}.gem")

package() {
  cd "$srcdir"

  msg 'Installing...'
  gem install \
    --no-user-install \
    --ignore-dependencies \
    -i "$pkgdir$(ruby -rubygems -e'puts Gem.default_dir')" \
    ${pkgname#*-}-$pkgver.gem
}

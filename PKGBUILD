# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-rugged
pkgver=0.22.2
pkgrel=1
pkgdesc="Ruby binding to the libgit2 linkable library"
arch=('i686' 'x86_64')
url="https://github.com/libgit2/rugged"
license=('MIT')
depends=('libgit2' 'ruby')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('f7e6c8304eb5ec06c7366fb13e203eb738e20bf190c3aa99498d674db7b5379d')
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

# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-rugged
pkgver=0.23.3
pkgrel=1
pkgdesc="Ruby binding to the libgit2 linkable library"
arch=('i686' 'x86_64')
url="https://github.com/libgit2/rugged"
license=('MIT')
depends=('libgit2' 'ruby')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('1e83351b091d445933132a7db309613faa082171d873cebcd0343f5d7e9c1373')
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

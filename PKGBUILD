# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-rugged
pkgver=0.24.0
pkgrel=1
pkgdesc="Ruby binding to the libgit2 linkable library"
arch=('i686' 'x86_64')
url="https://github.com/libgit2/rugged"
license=('MIT')
depends=('libgit2' 'ruby')
makedepends=('cmake')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('d9c02710c14af233572baa3b96b9b62ce222f1a9197623e355eddaa2e06ad43a')
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

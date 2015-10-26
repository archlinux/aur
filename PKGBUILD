# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-babel-source
pkgver=5.8.27
pkgrel=1
pkgdesc="Babel JS source"
arch=('any')
url="https://rubygems.org/gems/babel-source"
license=('MIT')
depends=('ruby')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('de0c561201c6d5aa79eb271516d872096aed912b208dfceff379c4b87e56d706')
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

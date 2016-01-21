# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-babel-source
pkgver=5.8.35
pkgrel=1
pkgdesc="Babel JS source"
arch=('any')
url="https://rubygems.org/gems/babel-source"
license=('MIT')
depends=('ruby')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('79ef222a9dcb867ac2efa3b0da35b4bcb15a4bfa67b6b2dcbf1e9a29104498d9')
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

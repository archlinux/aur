# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-ruby-progressbar
pkgver=1.8.1
pkgrel=1
pkgdesc="Flexible text progress bar library for Ruby"
arch=('any')
url="https://github.com/jfelchner/ruby-progressbar"
license=('MIT')
depends=('ruby')
source=(https://rubygems.org/downloads/${pkgname##ruby-}-${pkgver}.gem)
sha256sums=('95ded755295440de814704970d7ccaf3cb259854534f03a03a6d05918f3eece3')
noextract=("${pkgname#*-}-${pkgver}.gem")

package() {
  cd "$srcdir"

  msg2 'Installing...'
  gem install \
    --no-user-install \
    --ignore-dependencies \
    -i "$pkgdir$(ruby -rubygems -e'puts Gem.default_dir')" \
    ${pkgname##ruby-}-$pkgver.gem
}

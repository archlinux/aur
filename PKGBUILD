# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-ruby-progressbar
pkgver=1.8.0
pkgrel=1
pkgdesc="Flexible text progress bar library for Ruby"
arch=('any')
url="https://github.com/jfelchner/ruby-progressbar"
license=('MIT')
depends=('ruby')
source=(https://rubygems.org/downloads/${pkgname##ruby-}-${pkgver}.gem)
sha256sums=('78020988fc8603843747e316edb8fc50481c6842583eab5749e29fbbc9660f54')
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

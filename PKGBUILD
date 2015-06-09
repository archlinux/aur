# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-ruby-progressbar
pkgver=1.7.5
pkgrel=1
pkgdesc="Flexible text progress bar library for Ruby"
arch=('any')
url="https://github.com/jfelchner/ruby-progressbar"
license=('MIT')
depends=('ruby')
source=(https://rubygems.org/downloads/${pkgname##ruby-}-${pkgver}.gem)
sha256sums=('71c754e2e3f26b87f307e360dee8f2267800b88327a7def0098d7e6cb752d643')
noextract=("${pkgname#*-}-${pkgver}.gem")

package() {
  cd "$srcdir"

  msg 'Installing...'
  gem install \
    --no-user-install \
    --ignore-dependencies \
    -i "$pkgdir$(ruby -rubygems -e'puts Gem.default_dir')" \
    ${pkgname##ruby-}-$pkgver.gem
}

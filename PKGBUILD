# Maintainer: boosterdev@linuxmail.org

pkgname=ruby-ruby-progressbar
pkgver=1.8.2
pkgrel=1
pkgdesc="Flexible text progress bar library for Ruby"
arch=('any')
url="https://github.com/jfelchner/ruby-progressbar"
license=('MIT')
depends=('ruby')
source=(https://rubygems.org/downloads/${pkgname##ruby-}-${pkgver}.gem)
sha256sums=('51394d27a4f84bc8d81666128e0d72f3b286da9234ffbe8c47e2978d8212fa97')
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

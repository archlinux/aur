# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-awesome_print
pkgver=1.6.1
pkgrel=1
pkgdesc="Pretty print your Ruby objects with style"
arch=('any')
depends=('ruby')
url="https://github.com/michaeldv/awesome_print"
license=('MIT')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('0d8be8d9b270b900a337356cb9453ffdaf219d29902f14bbe4f120ecfdd38fef')
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

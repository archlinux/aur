# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=guard
pkgname=ruby-$_gemname
pkgver=2.14.1
pkgrel=1
pkgdesc="Guard is a command line tool to easily handle events on file system modifications."
arch=('any')
url="http://guardgem.org/"
license=('MIT')
depends=('ruby' 'ruby-formatador>=0.2.4' 'ruby-listen>=2.7' 'ruby-lumberjack>=1.0' 'ruby-pry>=0.9.12' 'ruby-thor>=0.18.1')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
sha512sums=('00e3a9fbb53edeef95f0a7d037429949774cbbaa65c39beb4bc8429926687f9e40d3a5e6a249dbcdbfba6f2dd56d2e673b396a7e371864cdab3bb4d822fa8fc1')

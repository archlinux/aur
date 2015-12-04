# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=guard
pkgname=ruby-$_gemname
pkgver=2.13.0
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
sha512sums=('42a19077f5ff23805c44ae43410d269f5b9539db8375054ccc57ff0c3a20cd8ac5d5958a7566fc625a75938a2e475219f8ab5d9272931f1263bdf50c92055912')

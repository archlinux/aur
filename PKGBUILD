# Maintainer: Severen Redwood <severen.redwood@gmail.com>

pkgname=confmacs
pkgver=0.2.0
pkgrel=1
pkgdesc="An Emacs configuration switcher."
arch=('any')
license=('GPL3')
makedepends=('ruby')
depends=('ruby-thor>=0.19.1' 'ruby-colorize>=0.7.3' 'ruby-highline>=1.7.2')
url='https://github.com/SShrike/confmacs'
source=("http://rubygems.org/downloads/$pkgname-$pkgver.gem")
md5sums=('a7574ba12d9e342feda23cfeb9187ce5')
noextract=("$pkgname-$pkgver.gem")

package() {
  cd "$srcdir"
  local _gemdir=$(ruby -e 'puts Gem.default_dir')
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
}

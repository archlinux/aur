# Maintainer: farwayer <farwayer@gmail.com>

_gemname=os
pkgname=ruby-$_gemname
pkgver=1.0.1
pkgrel=1
pkgdesc="The OS gem allows for some useful and easy functions, like OS.windows? (=> true or false) OS.bits ( => 32 or 64) etc"
arch=('any')
url="https://github.com/rdp/os"
license=('MIT')
depends=('ruby')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('e3a8124676944a62f8706e6b3942786aad4ee585460bc7c9df548c17c02c251b')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  install -Dm644 "$pkgdir$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


# Maintainer: mnussbaum <michaelnussbaum08@gmail.com>
# Past maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=ruby-progressbar
pkgver=1.10.1
pkgrel=1
pkgdesc="A text progress bar library for Ruby"
arch=(any)
url="https://github.com/jfelchner/ruby-progressbar"
license=("MIT")
depends=("ruby")
provides=("ruby-ruby-progressbar")
conflicts=("ruby-ruby-progressbar")
makedepends=(rubygems)
source=(http://rubygems.org/downloads/$pkgname-$pkgver.gem)
sha256sums=("ee23400615f91c2ce6bc1e3bfa98392302ef38cbba8ad6de1bc26a4e1a88e7cc")
noextract=($pkgname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -e"puts Gem.default_dir")"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $pkgname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
}

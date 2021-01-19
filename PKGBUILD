# Maintainer: mnussbaum <michaelnussbaum08@gmail.com>

_gemname=benchmark
pkgname=ruby-benchmark
pkgver=0.1.1
pkgrel=1
pkgdesc="A performance benchmarking library"
arch=("any")
makedepends=(rubygems)
url="https://github.com/ruby/benchmark"
noextract=($_gemname-$pkgver.gem)
license=("MIT")
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=("86a5c212232bea5bec7d9cdff8a11931eb21693c39c42ca5d8673b00c8a179cb")

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

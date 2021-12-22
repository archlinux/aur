# Maintainer: mnussbaum <michaelnussbaum08@gmail.com>

_gemname=benchmark
pkgname=ruby-benchmark
pkgver=0.2.0
pkgrel=1
pkgdesc="A performance benchmarking library"
arch=("any")
makedepends=(rubygems)
url="https://github.com/ruby/benchmark"
noextract=($_gemname-$pkgver.gem)
license=("MIT")
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=("5f7087b794613abdd3ac9c13f4351f65b164bcb15ced2ad29508e365f9b28c77")

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

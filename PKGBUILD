# Maintainer: Filth <filth [at] wagn [dot] me>

_gemname="httpx"
pkgname="ruby-$_gemname"
pkgver=1.6.3
pkgrel=1
arch=("any")
pkgdesc="A client library for making HTTP requests from Ruby."
url="https://rubygems.org/gems/$_gemname"
license=("Apache 2.0")
depends=("ruby" "ruby-http-2")
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
sha256sums=('1b4a11b9572b78839f649ad6ebbe09b5f467cc458e0ee408bddc902b273a2e8a')
noextract=("$_gemname-$pkgver.gem")
options=(!emptydirs)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

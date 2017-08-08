# Maintainer: Grey Christoforo <grey@christoforo.net>

_gemname=gollum
pkgname=ruby-$_gemname
pkgver=4.1.1
pkgrel=3
pkgdesc='A simple, Git-powered wiki.'
arch=(any)
url='http://github.com/gollum/gollum'
license=(MIT)
depends=(ruby ruby-gollum-lib ruby-kramdown ruby-sinatra ruby-mustache ruby-useragent)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem

  rm -rf "$pkgdir/$_gemdir/cache"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('fa70f19bb0e43a239d672bc9a38b79a8bc9bed344fc80794dfefa68b3c742a4b')

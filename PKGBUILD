# Maintainer: Simon Wörner <arch-pkg@simon-woerner.de>

_gemname=vegas
pkgname=ruby-$_gemname
pkgver=0.1.11
pkgrel=1
pkgdesc='Vegas aims to solve the simple problem of creating executable versions of Sinatra/Rack apps.'
arch=(any)
url='http://code.quirkey.com/vegas'
license=()
depends=(ruby ruby-rack)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('9c5aa3cf441cadae6ef8731942d7803c6e899531')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

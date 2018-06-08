# Maintainer: Simon Wörner <arch-pkg@simon-woerner.de>

_gemname=rack-flash3
pkgname=ruby-$_gemname
pkgver=1.0.5
pkgrel=1
pkgdesc='Flash hash implementation for Rack apps.'
arch=(any)
url='https://github.com/treeder/rack-flash'
license=()
depends=(ruby ruby-rack)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('872a8d3d6a8015640075625d7250b3667f21882c')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Simon Wörner <arch-pkg@simon-woerner.de>

_gemname=sinatra-simple-navigation
pkgname=ruby-$_gemname
pkgver=4.1.0
pkgrel=1
pkgdesc='A Sinatra extension to enable creating navigations with the simple-navigation gem. Also works for Padrino.'
arch=(any)
url='http://github.com/codeplant/sinatra-simple-navigation'
license=(MIT)
depends=(ruby ruby-simple-navigation ruby-sinatra)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('b40e48dc6e18eac99dba58b088210760a78ee337')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Simon Wörner <arch-pkg@simon-woerner.de>

_gemname=simple-navigation
pkgname=ruby-$_gemname
pkgver=4.0.5
pkgrel=1
pkgdesc='simple-navigation is a ruby library for creating navigations (with multiple levels) for your Rails, Sinatra or Padrino application.'
arch=(any)
url='http://github.com/codeplant/simple-navigation'
license=(MIT)
depends=(ruby ruby-activesupport)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('07f001c92f6252b991738890ba6765a8a7cc51a9')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

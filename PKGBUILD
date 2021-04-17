# Maintainer: Reik Keutterling <spielkind at gmail dot com>

_gemname=revdev
pkgname=ruby-$_gemname
pkgver=0.2.1
pkgrel=2
pkgdesc="revdev is a ruby binding to handling event devices."
arch=(any)
url="https://github.com/kui/revdev"
license=(MIT)
depends=(ruby ruby-bundler)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('a411f619f8b3226e4bd181e65dc574184b504a55')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

# Maintainer: Simon Wörner <arch-pkg@simon-woerner.de>

_gemname=versionomy
pkgname=ruby-$_gemname
pkgver=0.5.0
pkgrel=1
pkgdesc='Versionomy is a generalized version number library.'
arch=(any)
url='http://dazuma.github.com/versionomy'
license=(BSD-3-Clause)
depends=(ruby ruby-blockenspiel)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('c2b10fa6307e1a5a80a747471935a57133aebf97')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

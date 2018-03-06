#Maintainer: wickdchromosome <capsule.edu@gmail.com>

_gemname=blankslate
pkgname=ruby-$_gemname-2
pkgver=2.1.2.4
pkgrel=1
pkgdesc='BlankSlate extracted from Builder.'
arch=(any)
url='http://github.com/masover/blankslate'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('f12304a670c66f0d289daf57c6412b3a1af25601')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

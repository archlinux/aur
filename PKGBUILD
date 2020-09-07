# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_gemname=bake
pkgname=ruby-$_gemname
pkgver=0.14.2
pkgrel=1
pkgdesc='A replacement for rake with a simpler syntax.'
provides=(bake)
arch=(any)
url='https://github.com/ioquatix/bake'
license=(MIT)
depends=('ruby-samovar>=2.1')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('49c68f05177b6b0bdc8c4d61888a73a4c9f3635a80b618b9429f1caab0e1a415')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

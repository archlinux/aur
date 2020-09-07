# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_gemname=console
pkgname=ruby-$_gemname
pkgver=1.9.0
pkgrel=2
pkgdesc='Beautiful logging for Ruby.'
arch=(any)
url='https://github.com/socketry/console'
license=(MIT)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('c4aedecb413edd0b96936c3efb00ebc8b6fb9323bde6c85f431f385c572277e5')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

# Maintainer: Reik Keutterling <spielkind at gmail dot com>

_gemname=callbacks_attachable
pkgname=ruby-$_gemname-2.3
pkgver=2.3.1
pkgrel=1
pkgdesc="Attach callbacks to ruby objects. Then, trigger and detach them."
arch=(any)
url="https://github.com/christopheraue/m-ruby-callbacks_attachable"
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('ce9c1ba9bb3f4c364b986521f4be13e0a38bec96')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

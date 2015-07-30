# Maintainer: MadPhysicist <jfoxrabinovitz at gmail dot com>
# Contributor: tuftedocelot@fastmail.fm
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: oliparcol <oliparcol AT gmail DOT com>

_gemname=posix-spawn
pkgname=ruby-$_gemname
pkgver=0.3.11
pkgrel=1
pkgdesc='posix_spawnp(2) for ruby'
arch=(any)
url='http://github.com/rtomayko/posix-spawn'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('b932835dd6eb241b255ba51767b68a58299abbb0fb344cb874dcd23d57b75414')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}


# Maintainer: MadPhysicist <jfoxrabinovitz at gmail dot com>
# Contributor: tuftedocelot@fastmail.fm
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: oliparcol <oliparcol AT gmail DOT com>

_gemname=posix-spawn
pkgname=ruby-$_gemname
pkgver=0.3.13
pkgrel=1
pkgdesc='posix-spawn uses posix_spawnp(2) for faster process spawning'
arch=(any)
url='http://github.com/rtomayko/posix-spawn'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('5c32e71fc1773f615234ad929b2b530ab6f84e5d43af30f2caf8146de3adbdde')

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
    rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
    install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}


# Contributor: MadPhysicist <jfoxrabinovitz at gmail dot com>
# Contributor: tuftedocelot@fastmail.fm
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: oliparcol <oliparcol AT gmail DOT com>

_gemname=posix-spawn
pkgname=ruby-$_gemname
pkgver=0.3.15
pkgrel=1
pkgdesc='posix-spawn uses posix_spawnp(2) for faster process spawning'
arch=(any)
url='http://github.com/rtomayko/posix-spawn'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('a2e0109bf9b9e041e74359aba9d6e9e92c1122cbdb15f6e9779d61aab606ab32')

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
    rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
    install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}


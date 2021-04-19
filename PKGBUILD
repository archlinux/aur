# Maintainer: Jonne Haß <me@jhass.eu>
# Contributor: boosterdev@linuxmail.org

pkgname="ruby-slop"
pkgver="4.8.2"
pkgrel=1
arch=("any")
pkgdesc="Simple Lightweight Option Parsing"
url="https://rubygems.org/gems/slop"
license=("MIT")
makedepends=("ruby")
optdepends=("ruby-minitest" "ruby-rake")
source=("https://rubygems.org/gems/slop-${pkgver}.gem")
sha256sums=('a3d5be3ad304b9dbd00b7c18a0a067b09ff6fd28485d4c6b05adb294d1eea115')
noextract=("slop-${pkgver}.gem")


package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" slop-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/slop-$pkgver.gem"
}

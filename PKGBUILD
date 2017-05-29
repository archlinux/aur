# Maintainer: boosterdev@linuxmail.org

pkgname="ruby-slop"
pkgver="4.5.0"
pkgrel=1
arch=("any")
pkgdesc="Simple Lightweight Option Parsing"
url="https://rubygems.org/gems/slop"
license=("MIT")
makedepends=("ruby")
optdepends=("ruby-minitest" "ruby-rake")
source=("https://rubygems.org/gems/slop-${pkgver}.gem")
sha256sums=('17542a5c73cbf6a76f8638939781e4431d07dc64b359b958b23383574641d52d')
noextract=("slop-${pkgver}.gem")


package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" slop-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/slop-$pkgver.gem"
}

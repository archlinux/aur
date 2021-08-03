# Maintainer: Jonne Haß <me@jhass.eu>
# Contributor: boosterdev@linuxmail.org

pkgname="ruby-slop"
pkgver=4.9.1
pkgrel=1
arch=("any")
pkgdesc="Simple Lightweight Option Parsing"
url="https://rubygems.org/gems/slop"
license=("MIT")
makedepends=("ruby")
optdepends=("ruby-minitest" "ruby-rake")
source=("https://rubygems.org/gems/slop-${pkgver}.gem")
sha256sums=('498de9c170ab15573a69aca92cc6199122be319e108de0f74a41cb26abdceb18')
noextract=("slop-${pkgver}.gem")


package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" slop-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/slop-$pkgver.gem"
}

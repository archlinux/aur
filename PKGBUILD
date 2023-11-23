# Maintainer: Jonne Haß <me@jhass.eu>
# Contributor: boosterdev@linuxmail.org

pkgname="ruby-slop"
pkgver=4.10.1
pkgrel=1
arch=("any")
pkgdesc="Simple Lightweight Option Parsing"
url="https://rubygems.org/gems/slop"
license=("MIT")
makedepends=("ruby")
optdepends=("ruby-minitest" "ruby-rake")
source=("https://rubygems.org/gems/slop-${pkgver}.gem")
sha256sums=('844322b5ffcf17ed4815fdb173b04a20dd82b4fd93e3744c88c8fafea696d9c7')
noextract=("slop-${pkgver}.gem")


package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" slop-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/slop-$pkgver.gem"
}

# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Hao Long <aur@esd.cc>
_gemname=selenium-webdriver
pkgname=ruby-$_gemname
pkgver=4.41.0
pkgrel=1
pkgdesc="A browser automation framework and ecosystem"
arch=(x86_64)
url=https://github.com/SeleniumHQ/selenium
license=(Apache-2.0)
depends=(
ruby-base64
ruby-logger
ruby-rexml
ruby-rubyzip
ruby-websocket
)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
b2sums=('035039924ae1dcd217fc3fb5e7b7df525c1c6250395a7654012bef9aab999ff2d3326d1dd09ea91fe07f83acad4afba54e82896c59568636f235ed3d3967bbf6')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

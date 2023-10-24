# Maintainer: Hao Long <aur@esd.cc>

_gemname=selenium-webdriver
pkgname=ruby-$_gemname
pkgver=4.14.0
pkgrel=1
pkgdesc="A browser automation framework and ecosystem"
arch=(x86_64)
url=https://github.com/SeleniumHQ/selenium
license=(Apache)
depends=(ruby-childprocess ruby-rubyzip)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
b2sums=('03e211398b79849c42e18928897f9ed847905d3e92edac35ba0ca1e4b7afa67ffa860a8c27617f8f06b4244fb6d637073a305b72b5422b3a3a372631c766f759')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

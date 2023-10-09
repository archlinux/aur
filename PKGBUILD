# Maintainer: Hao Long <aur@esd.cc>

_gemname=selenium-webdriver
pkgname=ruby-$_gemname
pkgver=4.13.1
pkgrel=1
pkgdesc="A browser automation framework and ecosystem"
arch=(x86_64)
url=https://github.com/SeleniumHQ/selenium
license=(Apache)
depends=(ruby-childprocess ruby-rubyzip)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
b2sums=('7a50f5515e65312a75b9a2c2d845c7e3f7f27b31eafd5d48419b5b346c59bedd94b3a6e53670a774a27ba0883dff0cdb9b49dd5e947dcfa5095d95d63a458156')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

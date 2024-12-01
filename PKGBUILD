# Maintainer: Hao Long <aur@esd.cc>
# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
_gemname=selenium-webdriver
pkgname=ruby-$_gemname
pkgver=4.27.0
pkgrel=1
pkgdesc="A browser automation framework and ecosystem"
arch=(x86_64)
url=https://github.com/SeleniumHQ/selenium
license=(Apache)
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
b2sums=('44fa6622189316c6606f1edbdaed8834a4a0ab0c12da81fca51fcf28d8f07cc7de6233c689cabf0e3fb242b0667687d3d9213887076ef4e24387f3fc5ba59c3a')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Hao Long <aur@esd.cc>
_gemname=selenium-webdriver
pkgname=ruby-$_gemname
pkgver=4.31.0
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
b2sums=('a0445455aba8b0c5d3a850cc67c623f4d2cf55254e1067ce8ade3a7837a14b8cc906758c5e88aa9b23e2c481d9d3493cf675c9dce62797ac418252dcc280d9cc')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

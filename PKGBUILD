# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Hao Long <aur@esd.cc>
_gemname=selenium-webdriver
pkgname=ruby-$_gemname
pkgver=4.38.0
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
b2sums=('4f60da6b53bc5d02ab203733b984603ffc2a7acec6c44d8a263af2439f2405a9f275166d9f026692d998079235d4a6eb6042d64b55e2a759d6fa10e496111ef1')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

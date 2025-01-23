# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Hao Long <aur@esd.cc>
_gemname=selenium-webdriver
pkgname=ruby-$_gemname
pkgver=4.28.0
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
b2sums=('3faf0c45c304872729978dbc29de587c9c05a8168d12c5e5767d0d671f0fbf9c847027f294f568dd3a3742c6202fa6af0b8a61e31dc1a1071d19b26df71139a5')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Hao Long <aur@esd.cc>
_gemname=selenium-webdriver
pkgname=ruby-$_gemname
pkgver=4.39.0
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
b2sums=('3540270cb0042cd0be78d65c24ff99b1c469659949b7aa7d6c29795c9b71ef1fceec9613faedbbff95ac3e82c603d17dfaac0befded4aa67adb7b2d24f984922')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

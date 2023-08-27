# Maintainer: Hao Long <aur@esd.cc>

_gemname=selenium-webdriver
pkgname=ruby-$_gemname
pkgver=4.11.0
pkgrel=1
pkgdesc="A browser automation framework and ecosystem"
arch=(x86_64)
url=https://github.com/SeleniumHQ/selenium
license=(Apache)
depends=(ruby-childprocess ruby-rubyzip)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
b2sums=('bedbc18c14ab67c1bde05a35b5b66f1fb6da576d616a40d5293358efc51dfaa00f816d70e92578b1bee82de0a17ee39950eb69542ef2e661bd6a015f5f01032a')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

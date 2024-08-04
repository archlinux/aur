# Maintainer: Hao Long <aur@esd.cc>

_gemname=selenium-webdriver
pkgname=ruby-$_gemname
pkgver=4.23.0
pkgrel=1
pkgdesc="A browser automation framework and ecosystem"
arch=(x86_64)
url=https://github.com/SeleniumHQ/selenium
license=(Apache)
depends=(ruby-childprocess ruby-rubyzip)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
b2sums=('a66609869c937c0bf1aba2a6a172321500dd44a9a0c29d72c56bafbfea62b5981e17e6d1fdbd81a64801945dee8477c5eae3ba11c9b45efbfb8a359b2ad026af')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

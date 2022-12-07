# Maintainer: Hao Long <aur@esd.cc>

_gemname=selenium-webdriver
pkgname=ruby-$_gemname
pkgver=4.7.1
pkgrel=1
pkgdesc="A browser automation framework and ecosystem"
arch=(x86_64)
url=https://github.com/SeleniumHQ/selenium
license=(Apache)
depends=(ruby-childprocess ruby-rubyzip)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
b2sums=('e2f3455916248edfe853dea221ce2139cdaf980b746c577742f1e142a0a52b1f67f154ec9a133d8aab04facb5d5330f7cc8740408b86f508a6539e1bfa20e567')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


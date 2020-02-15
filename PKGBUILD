# Maintainer: Hao Long <aur@esd.cc>

_gemname=XSpear
pkgname=ruby-xspear
pkgver=1.4.0
pkgrel=1
pkgdesc='Powerfull XSS Scanning and Parameter Analysis tool&gem'
arch=(any)
url='https://github.com/hahwul/XSpear'
license=(MIT)
depends=(ruby-colorize ruby-selenium-webdriver ruby-terminal-table ruby-progress_bar)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('5fd9b571ab1509dab9628c1e38e884157effef8bd590cce048bdeed7296f3c4f')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

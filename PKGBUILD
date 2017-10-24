# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

_gemname=smarter_csv
pkgname=ruby-$_gemname
pkgver=1.1.4
pkgrel=1
pkgdesc='Ruby Gem for smarter importing of CSV Files (and CSV-like files), with lots of optional features, e.g. chunked processing for huge CSV files'
arch=('any')
url='https://github.com/tilo/smarter_csv'
license=('MIT' 'GPL2')
depends=('ruby')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha256sums=('f44fb4acee605e9b0dc27323b2398dc8ad3223ca34dfc70a3ab833d0bc2737f6')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

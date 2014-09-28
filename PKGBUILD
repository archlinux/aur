# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

_gemname=smarter_csv
pkgname=ruby-$_gemname
pkgver=1.0.17
pkgrel=1
pkgdesc='Ruby Gem for smarter importing of CSV Files (and CSV-like files), with lots of optional features, e.g. chunked processing for huge CSV files'
arch=('any')
url='https://github.com/tilo/smarter_csv'
license=('MIT' 'GPL2')
depends=('ruby')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha256sums=('6bfd97c36e200ea86b90eb8d512c2623f8e4a07c260b4968aa5807c9f053dac5')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

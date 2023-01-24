# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

_gemname=rubyXL
pkgname=ruby-rubyxl
pkgver=3.4.25
pkgrel=1
pkgdesc='gem which allows the parsing, creation, and manipulation of Microsoft Excel (.xlsx/.xlsm) Documents'
arch=(any)
url='https://rubygems.org/gems/rubyXL'
license=(MIT)
depends=('ruby-nokogiri' 'ruby-rubyzip')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('4f1a1b662dfe05271707e09d22f93d4d6645b82329959e7e333c05b46f6af490')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}


# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: farawayer <farwayer@gmail.com>

_gemname=googleauth
pkgname=ruby-$_gemname
pkgver=1.5.0
pkgrel=1
pkgdesc='Authorization for Google APIs, and support for Application Default Credentials'
arch=(any)
url='https://rubygems.org/gems/googleauth'
license=('Apache')
depends=('ruby-faraday' 'ruby-jwt' 'ruby-memoist' 'ruby-multi_json' 'ruby-os' 'ruby-signet')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('d1b06ff4ad2a044b0f2237da949e2f2f1db13ff936e7c3a3050cbb192cac4bfd')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

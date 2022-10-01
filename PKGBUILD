# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: farawayer <farwayer@gmail.com>

_gemname=googleauth
pkgname=ruby-$_gemname
pkgver=1.2.0
pkgrel=1
pkgdesc='Authorization for Google APIs, and support for Application Default Credentials'
arch=(any)
url='https://rubygems.org/gems/googleauth'
license=('Apache')
depends=('ruby-faraday' 'ruby-jwt' 'ruby-multi_json' 'ruby-os' 'ruby-signet')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('f74a577449dabbb9cc76d10383b41eb0ac1e9b5d958123209acd72e76c630b0c')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

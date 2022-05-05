# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: farawayer <farwayer@gmail.com>

_gemname=googleauth
pkgname=ruby-$_gemname
pkgver=1.1.3
pkgrel=1
pkgdesc='Authorization for Google APIs, and support for Application Default Credentials'
arch=(any)
url='https://rubygems.org/gems/googleauth'
license=('Apache')
depends=(
  'ruby'
  'ruby-faraday>=0.17.3' 'ruby-faraday<3'
  'ruby-jwt>=1.4' 'ruby-jwt<3'
  'ruby-memoist>=0.16' 'ruby-memoist<1'
  'ruby-multi_json>=1.11' 'ruby-multi_json<2'
  'ruby-os>=0.9' 'ruby-os<2'
  'ruby-signet>=0.16' 'ruby-signet<2'
)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('a98df1ff0b0109e7cfa97e5cc86415c0bb9f4b1cc9baa963bc04fcbbc4f100f9')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

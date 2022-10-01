# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_gemname=fog-internet-archive
pkgname=ruby-$_gemname
pkgver=0.0.2
pkgrel=1
pkgdesc='Module for the fog gem to support Internet Archive.'
arch=(any)
url='https://github.com/fog/fog-internet-archive'
license=(MIT)
depends=(ruby-fog-core ruby-fog-json ruby-fog-xml)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('e240af44a9364714ac781e277cbed6129a4de56f33d2f84b5a129d92e6103cfd')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}


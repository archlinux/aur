# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-aliyun
pkgname=ruby-$_gemname
pkgver=0.4.0
pkgrel=1
pkgdesc='As a FOG provider, fog-aliyun support aliyun OSS/ECS. It will support more aliyun services later.'
arch=(any)
url='https://github.com/fog/fog-aliyun'
license=(MIT)
depends=(ruby-addressable ruby-aliyun-sdk  ruby-fog-core ruby-fog-json ruby-ipaddress ruby-xml-simple)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('9b998b5ab91729145cf5be10e4d8e1e591fff2000e5410bd45f967d1886bd911ea8eb77da975823beb41f2378770d9cfde3347a584d2a9676d64967aee9af42b')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

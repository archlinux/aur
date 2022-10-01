# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_gemname=fog-ovirt
pkgname=ruby-$_gemname
pkgver=2.0.2
pkgrel=1
pkgdesc='This library can be used as a module for fog.'
arch=(any)
url='https://github.com/fog/fog-ovirt'
license=(MIT)
depends=(ruby-activesupport ruby-fog-core ruby-fog-json ruby-fog-xml ruby-ovirt-engine-sdk)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('3d4a1555fe78d8c30c6298f0a306c01591197a7ee25a788777b013f6a5e474c0')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}


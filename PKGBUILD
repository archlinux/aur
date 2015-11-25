# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-voxel
pkgname=ruby-$_gemname
pkgver=0.0.2
pkgrel=1
pkgdesc='Module for the '\''fog'\'' gem to support Voxel.'
arch=(any)
url='https://rubygems.org/gems/fog-voxel'
license=(MIT)
depends=(ruby ruby-fog-core ruby-fog-xml)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('e1232709e32dd742c85da18074070a54c76d4ef5')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

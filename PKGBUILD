# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-ecloud
pkgname=ruby-$_gemname
pkgver=0.3.0
pkgrel=1
pkgdesc='This library can be used as a module for fog or as standalone provider to use the Terremark EnterpriseCloud in applications.'
arch=(any)
url='https://rubygems.org/gems/fog-ecloud'
license=(MIT)
depends=(ruby ruby-fog-core ruby-fog-xml)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('6350b38c297638ac5efeb44fbc71b5cc465efb387580e8a0192ac1e190c2eda712bf05322f27cf7b2bbb4f040b06099c218d14cce50e7f675e71f66467b41c37')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

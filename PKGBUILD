# Maintainer: George Rawlinson <george@rawlinson.net.nz>

_gemname=tzinfo-data
pkgname=ruby-$_gemname
pkgver=1.2020.6
pkgrel=1
pkgdesc='Timezone data for ruby-tzinfo'
arch=(x86_64)
url='https://github.com/tzinfo/tzinfo-data'
license=(MIT)
depends=(ruby ruby-tzinfo)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
b2sums=('4aa60497ef8337be8d72786fa5eaf56387063291c2f012b13a2efd0055345b18c98878e1a4739c2b4673342c9ba3d977dff06649aa6b7bb70550e7b6562ef13e')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

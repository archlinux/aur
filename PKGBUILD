# Maintainer: George Rawlinson <george@rawlinson.net.nz>

_gemname=tzinfo-data
pkgname=ruby-$_gemname
pkgver=1.2020.4
pkgrel=1
pkgdesc='Timezone data for ruby-tzinfo'
arch=(x86_64)
url='https://github.com/tzinfo/tzinfo-data'
license=(MIT)
depends=(ruby ruby-tzinfo)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
b2sums=('a83f6baec99cc131c39429612c7b9b6038b82851dc12b1069411bd2a109d37fa6c4b0269e785eef622e477b8515e2d4d2a5b98d586b0af60dcd5cf744615c1cf')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: George Rawlinson <george@rawlinson.net.nz>

_gemname=tzinfo-data
pkgname=ruby-$_gemname
pkgver=1.2020.1
pkgrel=1
pkgdesc='Timezone data for ruby-tzinfo'
arch=(x86_64)
url='https://github.com/tzinfo/tzinfo-data'
license=(MIT)
depends=(ruby ruby-tzinfo)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
b2sums=('79abe079d811b3ee03e827cf19a4cfaa4d1be5fb07a9605ce393296858e9f6458659f70a8abbb718a4e24d31a89980677d4f8c268d2ddb30475656fc7fe26dae')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

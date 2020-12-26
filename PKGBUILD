# Maintainer: George Rawlinson <george@rawlinson.net.nz>

_gemname=tzinfo-data
pkgname=ruby-$_gemname
pkgver=1.2020.5
pkgrel=1
pkgdesc='Timezone data for ruby-tzinfo'
arch=(x86_64)
url='https://github.com/tzinfo/tzinfo-data'
license=(MIT)
depends=(ruby ruby-tzinfo)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
b2sums=('5ce18a56aab9b136f1c49fe3d17e7ad1eca89ccc02beacf899f81d9e0dfa8c0d6d3db0154762609225497571b0ead9d7b468bb423062ffb5c05ef9bd8249ab68')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

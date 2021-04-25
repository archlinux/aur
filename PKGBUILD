# Maintainer: George Rawlinson <george@rawlinson.net.nz>

_gemname=tzinfo-data
pkgname=ruby-$_gemname
pkgver=1.2021.1
pkgrel=2
pkgdesc='Timezone data for ruby-tzinfo'
arch=(x86_64)
url='https://github.com/tzinfo/tzinfo-data'
license=(MIT)
depends=(ruby ruby-tzinfo)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
b2sums=('aecf0e451679496606ba682b3bf60954863058c9c08344c74ccc0a8a5118df5b6afd1e1d53d4479dbdc797a9c4d5186578a877e43fc782b206744d52bcc44914')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

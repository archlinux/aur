# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: farawayer <farwayer@gmail.com>

_gemname=CFPropertyList
pkgname=ruby-cfpropertylist
pkgver=3.0.7
pkgrel=1
pkgdesc='Read, write and manipulate both binary and XML property lists as defined by apple.'
arch=(any)
url='https://github.com/ckruse/CFPropertyList'
license=(MIT)
depends=(ruby-base64 ruby-nkf ruby-rexml)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('c45721614aca8d5eb6fa216f2ec28ec38de1a94505e9766a20e98745492c3c4c')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

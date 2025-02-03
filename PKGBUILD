# Maintainer: Michał Wojdyła < micwoj9292@gmail.com
# Contributor: DDoSolitary <DDoSolitary@gmail.com>
# Contributor: Rhys Davies <rhys@johnguant.com>

_gemname=launchy
pkgname=ruby-$_gemname
pkgver=3.1.0
pkgrel=1
pkgdesc='Launchy is helper class for launching cross-platform applications in a fire and forget manner.'
arch=(any)
url='http://github.com/copiousfreetime/launchy'
license=(ISC)
depends=(ruby ruby-addressable ruby-childprocess ruby-logger)
makedepends=(ruby-rdoc)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('4964ae775cd802f5a57ae5584fbdb1151a8908cb0c626341563430d614a59572')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

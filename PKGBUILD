# Contributor: DDoSolitary <DDoSolitary@gmail.com>
# Contributor: Rhys Davies <rhys@johnguant.com>

_gemname=launchy
pkgname=ruby-$_gemname
pkgver=3.0.1
pkgrel=1
pkgdesc='Launchy is helper class for launching cross-platform applications in a fire and forget manner.'
arch=(any)
url='http://github.com/copiousfreetime/launchy'
license=(ISC)
depends=(ruby ruby-addressable ruby-childprocess)
makedepends=(ruby-rdoc)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('b7fa60bda0197cf57614e271a250a8ca1f6a34ab889a3c73f67ec5d57c8a7f2c')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

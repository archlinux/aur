# Maintainer: Anatoly Bashmakov <anatoly at posteo dot net>

_gemname=mustache
pkgname=ruby-$_gemname-0
pkgver=0.99.8
pkgrel=2
pkgdesc='Mustache is a framework-agnostic way to render logic-free views.'
arch=(any)
url='http://github.com/mustache/mustache'
license=(MIT)
depends=(ruby)
makedepends=(ruby-rdoc)
provides=('ruby-mustache=0.99.8')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha1sums=('0baaada539b2dcb5175bcdac186f407228acce7c')
noextract=($_gemname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -e 'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm -r "$pkgdir/usr/bin/"
}

# Maintainer: Bennett Piater <bennett at piater dot name>

_gemname=textpow19
pkgname=ruby-$_gemname
pkgver=0.11.0
pkgrel=1
pkgdesc='A library for parsing TextMate bundles.'
arch=('any')
url='https://rubygems.org/gems/textpow19'
license=(unknown)
depends=(ruby ruby-plist)
makedepends=(ruby-hoe ruby-rubyforge)
options=(!emptydirs)

source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('0ea4d95cf8a7853a2e71e32d5d897b2ac7fb27ae90cf48ade2f258e2c680d098')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  #install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

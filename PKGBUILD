# Maintainer: Bennett Piater <bennett at piater dot name>

_gemname=coloration
pkgname=ruby-$_gemname
pkgver=0.4.0
pkgrel=2
pkgdesc='Convert Textmate color schemes to Vim, JEdit and KDevelop/Kate/Kwrite formats.'
arch=('any')
url='https://github.com/isa/coloration'
license=(MIT)
depends=(ruby
	     ruby-plist
	     ruby-textpow19)
makedepends=(ruby-bundler
	         ruby-guard
	         ruby-minitest
	         ruby-yard)
options=(!emptydirs)

source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('8a4a75d1eb756e82f3c39aefb28d3ff8b5652d8fc2014aba7c9fecb0fecbb44a')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  #install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

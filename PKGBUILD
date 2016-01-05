# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

_gemname=treetop
pkgname=ruby-$_gemname-1.4
pkgver=1.4.15
pkgrel=1
pkgdesc='A Ruby-based text parsing and interpretation DSL'
arch=(any)
url='https://github.com/cjheath/treetop'
license=(MIT)
depends=(ruby ruby-polyglot)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('8c6ce803f909b9e1dfcb24100c283642f43d90d1')

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	rm -r "$pkgdir/usr/bin/"
}

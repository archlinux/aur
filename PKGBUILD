# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

_gemname=rugged
pkgname=ruby-$_gemname-0.17.0.b6
pkgver=0.17.0.b6
pkgrel=1
epoch=1
pkgdesc='Rugged is a Ruby binding to the libgit2 linkable library'
arch=(i686 x86_64)
url='http://github.com/libgit2/rugged'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('28cd9efc4a7b7873c2e03a62f6402b53221cb330')

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	rm -rf "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/vendor"
	install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Stick <stick@stma.is>

_gemname=asciidoctor-html5s
pkgname="ruby-$_gemname"
pkgver=0.3.0
pkgrel=9
pkgdesc='Semantic HTML5 converter (backend) for Asciidoctor'
arch=(x86_64)
url="https://github.com/jirutka/$_gemname"
license=(MIT)
depends=(asciidoctor ruby ruby-thread_safe)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('dc917b72397f1fa34c27b217977b33368418530f2a130b0691ab32e768d54a77')

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	find "$pkgdir/$_gemdir/extensions/" -name *.so -delete
}

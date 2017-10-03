# Maintainer: Patrick Lühne <patrick-arch@luehne.de>

_gemname=sass-listen
pkgname=ruby-$_gemname
pkgver=4.0.0
pkgrel=1
pkgdesc="This fork of guard/listen provides a stable API for users of the Ruby Sass CLI"
arch=("i686" "x86_64")
url="https://github.com/sass/listen"
license=("MIT")
depends=("ruby")
options=("!emptydirs")
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=($_gemname-$pkgver.gem)
sha256sums=("ae9dcb76dd3e234329e5ba6e213f48e532c5a3e7b0b4d8a87f13aaca0cc18377")

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

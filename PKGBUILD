# Maintainer: sum01 <sum01@protonmail.com>
pkgname=ruby-htmlbeautifier
pkgver=1.3.1
pkgrel=2
pkgdesc='A normaliser/beautifier for HTML that also understands embedded Ruby. Ideal for tidying up Rails templates.'
arch=('i686' 'x86_64')
url="https://github.com/threedaymonk/htmlbeautifier"
license=('MIT')
depends=('ruby')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/htmlbeautifier-$pkgver.gem"
	"$pkgname-COPYING.txt::https://github.com/threedaymonk/htmlbeautifier/raw/v$pkgver/COPYING.txt")
noextract=("htmlbeautifier-$pkgver.gem")
sha512sums=('7f877e98f6bd5c9a809830bd58629889d284b1ce699d8749b4c7ad639d81ab06e2d765fe0ef00915ce2c9f4d7afeb8246191718df7c34cafa6c6d383468de1fe'
            'cd6f96797fbc47d26f5a06c9881284729643d3b150c8817ef3de999070b5120bfb93ed9b73f642960ab73520ec710276f3a33edf52fbce87dc0f548b83899960')
package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" htmlbeautifier-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/htmlbeautifier-$pkgver.gem"
	install -Dm644 "$srcdir/$pkgname-COPYING.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

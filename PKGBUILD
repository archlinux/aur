# Maintainer: Stick <stick@stma.is>

_gemname=metasm
pkgname=ruby-$_gemname
pkgver=1.0.5
pkgrel=1
pkgdesc="Metasm is a cross-architecture assembler, disassembler, linker, and debugger."
arch=(any)
url="https://www.cr0.org/progs/metasm/"
license=('LGPL2.1')
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('919f6758f6044cc74ffbe34faa7d74b784a719dd67b5001ed80692b8db5cf236')

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

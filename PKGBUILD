# Maintainer: Aoibhinn di Tori <email@aoibh.in>

pkgname=ronn
pkgver=0.7.3
pkgrel=1
pkgdesc="Converts simple, human readable textfiles to roff for terminal display, and also to HTML"
arch=("any")
url="http://rtomayko.github.com/ronn"
license=('MIT')
depends=('ruby' 'ruby-hpricot' 'ruby-rdiscount' 'ruby-mustache')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
md5sums=('c5aa4ef58d35d0cc635b769281e03225')

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
}

# vim:set ts=4 sw=4 et:

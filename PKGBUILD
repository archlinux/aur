# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

_gemname=morphine
pkgname=ruby-$_gemname
pkgver=0.1.1
pkgrel=1
pkgdesc='A lightweight dependency injection framework for Ruby'
arch=(any)
url='https://github.com/bkeepers/morphine'
license=(none)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('5a508b1a1e5fc4aacb6c6d71741790b692f89240')

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

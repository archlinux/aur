# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

_gemname=greencard
pkgname=ruby-$_gemname
pkgver=0.0.5
pkgrel=1
pkgdesc='vCard support for ruby'
arch=(any)
url='https://github.com/hnrysmth/greencard'
license=(GPL custom)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('8a2d83f032e4f3d06eacb1b857f4c483fa13bc00')

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

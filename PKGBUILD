# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

_gemname=inifile
pkgname=ruby-$_gemname-2
pkgver=2.0.2
pkgrel=1
pkgdesc='INI file reader and writer'
arch=(any)
url='http://rubygems.org/gems/inifile'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem LICENSE)
noextract=($_gemname-$pkgver.gem)
sha1sums=('bc2275ce6486ee5ce450a0fafc6f83425bf2898e'
          'c5af9b6ff5afe9660dc65dc6c14facb3b75298f5')

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
